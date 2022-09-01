import React from "react";
import { useAuth } from "../context/AuthProvider";


function UserInfo() {
  const auth = useAuth();

  return (
  <div>
    <h6>School: University</h6>
    <h6>Grade: senior</h6>
    <h6>Class Schedule</h6>
    <h6>Current Tutoring Sessions:</h6>
    <h6>Tutor Notes:</h6>
    <h6>Teacher Notes:</h6>
    </div>
  );
}

export default UserInfo;
