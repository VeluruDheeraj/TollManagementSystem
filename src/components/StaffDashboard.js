import React, { useState } from "react";
import axios from "axios";
import "./StaffDashboard.css";

function StaffDashboard() {
  const [activeForm, setActiveForm] = useState(null);
  const [vehicleId, setVehicleId] = useState("");
  const [vehicleType, setVehicleType] = useState("");
  const [tollgateId, setTollgateId] = useState("");
  const [tollFee, setTollFee] = useState("");
  const [tollHistory, setTollHistory] = useState([]);
  const [tollgateSearchId, setTollgateSearchId] = useState("");
  const [checkFareDate, setCheckFareDate] = useState("");
  const [checkFareTollgateId, setCheckFareTollgateId] = useState("");
  const [checkFareResult, setCheckFareResult] = useState({ totalFare: 0, entries: [] });
  const [scheduleResult, setScheduleResult] = useState([]);
  const [loading, setLoading] = useState(false);

  const handleAddUser = async () => {
    if (!vehicleId || !vehicleType || !tollgateId || !tollFee) {
      alert("All fields are required.");
      return;
    }
    try {
      setLoading(true);
      await axios.post(
        "http://localhost:5000/add-user",
        { vehicleId, vehicleType, tollgateId, tollFee },
        { headers: { Authorization: `Bearer ${localStorage.getItem("token")}` } }
      );
      alert("User entry added successfully.");
      cancelForm();
    } catch (error) {
      alert("Error adding user entry.");
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  const handleViewTollHistory = async () => {
    if (!tollgateSearchId) {
      alert("Please enter a Tollgate ID.");
      return;
    }
    try {
      setLoading(true);
      const response = await axios.get(
        `http://localhost:5000/view-toll-history/${tollgateSearchId}`,
        { headers: { Authorization: `Bearer ${localStorage.getItem("token")}` } }
      );
      setTollHistory(response.data.toll_history || []);
    } catch (error) {
      alert("Error fetching toll history.");
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  const handleCheckFare = async () => {
    if (!checkFareTollgateId || !checkFareDate) {
      alert("Please enter both Tollgate ID and Date.");
      return;
    }
    try {
      setLoading(true);
      const response = await axios.get(`http://localhost:5000/check-fare`, {
        params: { tollgateId: checkFareTollgateId, date: checkFareDate },
        headers: { Authorization: `Bearer ${localStorage.getItem("token")}` },
      });
      setCheckFareResult(response.data || { totalFare: 0, entries: [] });
    } catch (error) {
      alert("Error fetching fare information.");
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  const handleViewSchedule = async () => {
    if (!tollgateId) {
      alert("Please enter a Tollgate ID.");
      return;
    }
    try {
      setLoading(true);
      const response = await axios.get(
        `http://localhost:5000/tollgate-schedule/${tollgateId}`,
        { headers: { Authorization: `Bearer ${localStorage.getItem("token")}` } }
      );
      setScheduleResult(response.data || []);
    } catch (error) {
      alert("Error fetching schedule.");
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  const cancelForm = () => {
    setActiveForm(null);
    setVehicleId("");
    setVehicleType("");
    setTollgateId("");
    setTollFee("");
    setTollgateSearchId("");
    setCheckFareDate("");
    setCheckFareTollgateId("");
    setCheckFareResult({ totalFare: 0, entries: [] });
    setScheduleResult([]);
  };

  const renderLoading = () => <p>Loading...</p>;

  return (
    <div className="dashboard-container">
      <h1>Staff Dashboard</h1>
      <div className="button-group">
        <button onClick={() => setActiveForm("add")}>Add User Entry</button>
        <button onClick={() => setActiveForm("view")}>View Toll History</button>
        <button onClick={() => setActiveForm("checkFare")}>Toll Records</button>
        
      </div>

      {activeForm === "add" && (
        <div className="form-container">
          <h2>Add User Entry</h2>
          <input
            type="text"
            placeholder="Vehicle ID"
            value={vehicleId}
            onChange={(e) => setVehicleId(e.target.value)}
          />
          <input
            type="text"
            placeholder="Vehicle Type"
            value={vehicleType}
            onChange={(e) => setVehicleType(e.target.value)}
          />
          <input
            type="number"
            placeholder="Tollgate ID"
            value={tollgateId}
            onChange={(e) => setTollgateId(e.target.value)}
          />
          <input
            type="number"
            placeholder="Toll Fee"
            value={tollFee}
            onChange={(e) => setTollFee(e.target.value)}
          />
          <div className="form-buttons">
            <button onClick={handleAddUser} disabled={loading}>
              {loading ? "Submitting..." : "Submit"}
            </button>
            <button onClick={cancelForm}>Cancel</button>
          </div>
        </div>
      )}

      {activeForm === "view" && (
        <div className="form-container">
          <h2>View Toll History</h2>
          <input
            type="text"
            placeholder="Tollgate ID"
            value={tollgateSearchId}
            onChange={(e) => setTollgateSearchId(e.target.value)}
          />
          <div className="form-buttons">
            <button onClick={handleViewTollHistory} disabled={loading}>
              {loading ? "Fetching..." : "View"}
            </button>
            <button onClick={cancelForm}>Cancel</button>
          </div>
          {loading ? (
            renderLoading()
          ) : tollHistory.length > 0 ? (
            <table>
              <thead>
                <tr>
                  <th>Tollgate ID</th>
                  <th>Vehicle ID</th>
                  <th>Vehicle Type</th>
                  <th>Fare</th>
                  <th>Date</th>
                  <th>Entry Time</th>
                  <th>Exit Time</th>
                </tr>
              </thead>
              <tbody>
                {tollHistory.map((entry, index) => (
                  <tr key={index}>
                    <td>{entry.tollgate_id}</td>
                    <td>{entry.vehicle_id}</td>
                    <td>{entry.vehicle_type}</td>
                    <td>{entry.fare}</td>
                    <td>{entry.date}</td>
                    <td>{entry.entry_time}</td>
                    <td>{entry.exit_time}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          ) : (
            <p>No history available.</p>
          )}
        </div>
      )}

      {activeForm === "checkFare" && (
        <div className="form-container">
          <h2>Check Fare</h2>
          <input
            type="text"
            placeholder="Tollgate ID"
            value={checkFareTollgateId}
            onChange={(e) => setCheckFareTollgateId(e.target.value)}
          />
          <input
            type="date"
            value={checkFareDate}
            onChange={(e) => setCheckFareDate(e.target.value)}
          />
          <div className="form-buttons">
            <button onClick={handleCheckFare} disabled={loading}>
              {loading ? "Checking..." : "Check"}
            </button>
            <button onClick={cancelForm}>Cancel</button>
          </div>
          {loading ? (
            renderLoading()
          ) : (
            checkFareResult && (
              <div>
                <h3>Total Fare Collected: {checkFareResult.totalFare}</h3>
                <ul>
                  {Array.isArray(checkFareResult.entries) && checkFareResult.entries.length > 0 ? (
                    checkFareResult.entries.map((entry, index) => (
                      <li key={index}>
                        {entry.vehicle_id} - {entry.fare}
                      </li>
                    ))
                  ) : (
                    <p>No fare records found.</p>
                  )}
                </ul>
              </div>
            )
          )}
        </div>
      )}

      {activeForm === "schedule" && (
        <div className="form-container">
          <h2>View Tollgate Schedule</h2>
          <input
            type="text"
            placeholder="Tollgate ID"
            value={tollgateId}
            onChange={(e) => setTollgateId(e.target.value)}
          />
          <div className="form-buttons">
            <button onClick={handleViewSchedule} disabled={loading}>
              {loading ? "Fetching..." : "View Schedule"}
            </button>
            <button onClick={cancelForm}>Cancel</button>
          </div>
          {loading ? (
            renderLoading()
          ) : scheduleResult.length > 0 ? (
            <ul>
              {scheduleResult.map((schedule, index) => (
                <li key={index}>
                  {schedule.time} - {schedule.vehicle_type}
                </li>
              ))}
            </ul>
          ) : (
            <p>No schedule available.</p>
          )}
        </div>
      )}
    </div>
  );
}

export default StaffDashboard;
