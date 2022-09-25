import React, { useState, useEffect } from "react";

function UserInfo() {
  const [userInfo, setUserInfo] = useState(false);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch("/user_info").then((res) => {
      if (res.ok) {
        res.json().then((data) => {
          console.log(data)
            setUserInfo({
              full_name: data[0].full_name,
              school: data[0].school,
              grade: data[0].grade,
              role: data[0].role,
              current_sessions: data[1],
              tutor_notes: [],
              teacher_notes: [],
            });
        });
      }
    });
    setLoading(false);
  }, []);

  return (
    <>
      {userInfo ? (
        <div>
          <h6>School: {userInfo.school}</h6>
          <h6>Grade: {userInfo.grade}</h6>
          <h6>Role: {userInfo.role}</h6>
          <h6>Class Schedule</h6>
          <h6>Current Tutoring Sessions: {userInfo.current_sessions.id}</h6>
          <h6>Tutor Notes:</h6>
          <h6>Teacher Notes:</h6>
        </div>
      ) : (
        <h1>Loading</h1>
      )}
    </>
  );
}

export default UserInfo;
