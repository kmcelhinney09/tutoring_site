import React from "react";
import { format } from "date-fns";
import Card from "react-bootstrap/Card";
import ListGroup from "react-bootstrap/ListGroup";

function UserInfo({ userData }) {
  return (
    <>
      {userData ? (
        <div>
          <h6>School: {userData.school.school_name}</h6>
          <h6>Grade: {userData.grade}</h6>
          <h6>Role: {userData.role}</h6>
          <h6>Class Schedule</h6>
          <Card style={{ width: "50rem" }}>
            <ListGroup variant="flush">
              {userData.student_schedule
                .sort((a, b) => (a.class_period > b.class_period ? 1 : -1))
                .map((classPeriod) => {
                  return (
                    <ListGroup.Item key={classPeriod.id}>
                      {classPeriod.subject} - Period {classPeriod.class_period}{" "}
                      with {classPeriod.teacher} from {classPeriod.start_time}{" "}
                      to {classPeriod.end_time}
                    </ListGroup.Item>
                  );
                })}
            </ListGroup>
          </Card>

          <h6>Current Tutoring Sessions:</h6>
          <Card style={{ width: "26rem" }}>
            <ListGroup variant="flush">
              {userData.booked_time_slots.map((session) => {
                return (
                  <ListGroup.Item key={session.id}>
                    {session.start_time} - {session.end_time}
                  </ListGroup.Item>
                );
              })}
            </ListGroup>
          </Card>
          <h6>Tutor Notes: </h6>
          {userData.tutor_notes.map((note) => {
            return (
              <Card key={note.id} border="success" style={{ width: "18rem" }}>
                <Card.Body>{note.tutor_name} says:</Card.Body>
                <Card.Text>{note.tutor_note}</Card.Text>
              </Card>
            );
          })}
          <h6>Teacher Notes:</h6>
          {userData.teacher_notes.map((note) => {
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
