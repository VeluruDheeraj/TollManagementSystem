import React, { useState } from "react";
import { useNavigate } from "react-router-dom";

function LoginAdmin() {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const navigate = useNavigate();

  // Hardcoded admin credentials
  const admins = [
    { username: "dheeraj", password: "dheeraj", role: "admin" },
    { username: "vipul", password: "vipul", role: "admin" },
    { username: "karthik", password: "karthik", role: "admin" },
    { username: "deepak", password: "deepak", role: "admin" },
  ];

  const handleSubmit = (e) => {
    e.preventDefault();

    if (!username || !password) {
      setError("Username and password are required.");
      return;
    }

    // Check if the entered username and password match any hardcoded admin
    const admin = admins.find(
      (admin) => admin.username === username && admin.password === password
    );

    if (admin) {
      // Store role and authentication status in localStorage
      localStorage.setItem("isAuthenticated", true);
      localStorage.setItem("role", admin.role);

      // Navigate to the admin dashboard
      navigate("/admin-dashboard");
    } else {
      setError("Invalid credentials for admin.");
    }
  };

  return (
    <div style={{
      display: "flex",
      flexDirection: "column",
      alignItems: "center",
      justifyContent: "center",
      height: "100vh",
      background: "linear-gradient(135deg, #a6c8ff 0%, #e0f3ff 100%)",
      padding: "20px",
      boxSizing: "border-box",
      fontFamily: "'Arial', sans-serif",
      color: "white"
    }}>
      <h1 style={{
        fontSize: "2.5rem",
        color: "white",
        marginBottom: "20px",
        textShadow: "2px 2px 5px rgba(0, 0, 0, 0.2)",
        fontWeight: "bold"
      }}>Login as Admin</h1>
      <form onSubmit={handleSubmit}>
        <input
          type="text"
          placeholder="Username"
          value={username}
          onChange={(e) => setUsername(e.target.value)}
          style={{
            margin: "10px 0",
            padding: "12px 15px",
            fontSize: "16px",
            width: "100%",
            maxWidth: "350px",
            borderRadius: "25px",
            border: "1px solid #ccc",
            backgroundColor: "white",
            boxShadow: "0 2px 8px rgba(0, 0, 0, 0.1)",
            transition: "all 0.3s ease-in-out"
          }}
        />
        <input
          type="password"
          placeholder="Password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          style={{
            margin: "10px 0",
            padding: "12px 15px",
            fontSize: "16px",
            width: "100%",
            maxWidth: "350px",
            borderRadius: "25px",
            border: "1px solid #ccc",
            backgroundColor: "white",
            boxShadow: "0 2px 8px rgba(0, 0, 0, 0.1)",
            transition: "all 0.3s ease-in-out"
          }}
        />
        {error && <p style={{
          color: "red",
          fontSize: "14px",
          marginTop: "10px"
        }}>{error}</p>}
        <div style={{ marginTop: "15px", textAlign: "center" }}>
          <button
            type="submit"
            style={{
              padding: "12px 30px",
              fontSize: "16px",
              cursor: "pointer",
              backgroundColor: "#2e79c9",
              color: "white",
              border: "none",
              borderRadius: "25px",
              transition: "background-color 0.3s ease",
              boxShadow: "0 4px 8px rgba(0, 0, 0, 0.2)",
              marginTop: "15px"
            }}
            onMouseOver={(e) => e.target.style.backgroundColor = "#18869c"}
            onMouseOut={(e) => e.target.style.backgroundColor = "#2e79c9"}
          >
            Login
          </button>
        </div>
      </form>
    </div>
  );
}

export default LoginAdmin;
