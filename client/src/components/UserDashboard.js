import React from "react";
import { useAuth } from "../context/AuthProvider";

function UserDashboard() {
  const auth = useAuth();
  
  // const userData = auth.currentUser.each()

  return (
    <div>
      <ul>
        <li>Full Name: {auth.currentUser.full_name}</li>
        <li>School: {auth.currentUser.school}</li>
        <li>Grade: {auth.currentUser.grade}</li>
        <li>User Role: {auth.currentUser.role}</li>
      </ul>
    </div>
  );
}

export default UserDashboard;
