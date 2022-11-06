import React from "react";
import Card from "react-bootstrap/Card";
import ListGroup from "react-bootstrap/ListGroup";
import Table from "react-bootstrap/esm/Table";

function UserInfo({ userData }) {
  return (
    <>
      {userData ? (
        <div>
          <h6>School: {userData.school.school_name}</h6>
          <h6>Grade: {userData.grade}</h6>
          <h6>Role: {userData.role}</h6>
          <h4>Class Schedule</h4>
          <Table>
            <thead>
              <tr>
                <th>Class Period</th>
                <th>Subject</th>
                <th>Teacher</th>
                <th>Start Time</th>
                <th>End Time</th>
              </tr>
            </thead>
            <tbody>
              {userData.student_schedule
                .sort((a, b) => (a.class_period > b.class_period ? 1 : -1))
                .map((classPeriod) => {
                  return (
                    <tr key={classPeriod.id}>
                      <td>{classPeriod.class_period}</td>
                      <td>{classPeriod.subject_name}</td>
                      <td>{classPeriod.teacher}</td>
                      <td>{classPeriod.start_time}</td>
                      <td>{classPeriod.end_time}</td>
                    </tr>
                  );
                })}
            </tbody>
          </Table>

          <h4>Current Tutoring Sessions:</h4>

          <Table>
            <thead>
              <tr>
                <th>Location</th>
                <th>Session</th>
                <th>Start Time</th>
                <th>End Time</th>
              </tr>
            </thead>
            <tbody>
              {userData.booked_time_slots.map((session) => {
                return (
                  <tr key={session.id}>
                    <td>{session.location_name}</td>
                    <td>{session.date}</td>
                    <td>{session.start_time}</td>
                    <td>{session.end_time}</td>
                  </tr>
                );
              })}
            </tbody>
          </Table>
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
                <Card.Text> {note.teacher_note} </Card.Text>
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
