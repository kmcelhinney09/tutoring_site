import React, { useState, useEffect } from "react";
import { format } from "date-fns";
import Card from "react-bootstrap/Card";
import ListGroup from "react-bootstrap/ListGroup";

function UserInfo() {
  const [userInfo, setUserInfo] = useState(false);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch("/user_info").then((res) => {
      if (res.ok) {
        res.json().then((data) => {
          // console.log(data);
          setUserInfo({
            full_name: data[0].full_name,
            school: data[6],
            grade: data[0].grade,
            role: data[0].role,
            current_sessions: data[1],
            tutor_notes: data[3],
            teacher_notes: data[4],
            class_schedule: data[5],
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
          <Card style={{ width: "50rem" }}>
            <ListGroup variant="flush">
              {userInfo.class_schedule
                .sort((a, b) => {
                  return a.class_period > b.class_period ? 1 : -1;
                })
                .map((classPeriod) => {
                  const start_time = format(
                    new Date(classPeriod.start_time),
                    "p"
                  );
                  const end_time = format(new Date(classPeriod.end_time), "p");
                  return (
                    <ListGroup.Item>
                      {classPeriod.subject} - Period {classPeriod.class_period}{" "}
                      with {classPeriod.teacher} from {start_time} to {end_time}
                    </ListGroup.Item>
                  );
                })}
            </ListGroup>
          </Card>

          <h6>Current Tutoring Sessions:</h6>
          <Card style={{ width: "26rem" }}>
            <ListGroup variant="flush">
              {userInfo.current_sessions.map((session) => {
                const start_time = format(new Date(session.start), "PPpp");
                const end_time = format(new Date(session.end), "PPpp");
                return (
                  <ListGroup.Item>
                    {start_time} - {end_time}
                  </ListGroup.Item>
                );
              })}
            </ListGroup>
          </Card>
          <h6>Tutor Notes: </h6>
          {userInfo.tutor_notes.map((note) => {
            return (
              <Card key={note.id} border="success" style={{ width: "18rem" }}>
                <Card.Body>{note.tutor_name} says:</Card.Body>
                <Card.Text>{note.tutor_note}</Card.Text>
              </Card>
            );
          })}
          <h6>Teacher Notes:</h6>
          {userInfo.teacher_notes.map((note) => {
            return (
              <Card key={note.id} border="success" style={{ width: "18rem" }}>
                <Card.Body>{note.teacher_name} says:</Card.Body>
                <Card.Text>{note.teacher_note}</Card.Text>
              </Card>
            );
          })}
        </div>
      ) : (
        <h1>Loading</h1>
      )}
    </>
  );
}

export default UserInfo;
