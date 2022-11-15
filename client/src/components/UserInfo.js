import React from "react";
import Card from "react-bootstrap/Card";
import Table from "react-bootstrap/esm/Table";
import Row from "react-bootstrap/esm/Row";
import Col from "react-bootstrap/esm/Col";
import { Link } from "react-router-dom";

function UserInfo({ userData }) {
  return (
    <>
      {userData ? (
        <div>
          <h6>School: {userData.school.school_name}</h6>
          <h6>Grade: {userData.grade}</h6>
          <h6>Role: {userData.role}</h6>
          <h4>Class Schedule</h4>
          <Table responsive="md">
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

          <Table responsive="md">
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
                    <td>
                      {session.building_name} - {session.location_name}
                    </td>
                    <td>{session.date}</td>
                    <td>{session.start_time}</td>
                    <td>{session.end_time}</td>
                  </tr>
                );
              })}
            </tbody>
          </Table>
          <h6>Tutor Notes: </h6>
          <Row xs={1} md={2} className="g-4">
            {userData.tutor_notes.map((note) => {
              return (
                <Col key={note.id}>
                  <Card border="success">
                    <Card.Body>
                      <Card.Title>{note.tutor_name} says:</Card.Title>
                      <Card.Text>{note.tutor_note}</Card.Text>
                    </Card.Body>
                  </Card>
                </Col>
              );
            })}
          </Row>
          <h6>Teacher Notes:</h6>
          <Row xs={1} md={2} className="g-4">
            {userData.teacher_notes.map((note) => {
              return (
                <Col key={note.id}>
                  <Card border="success">
                    <Card.Body>
                      <Card.Title>{note.teacher_name} says:</Card.Title>
                      <Card.Text>{note.teacher_note}</Card.Text>
                    </Card.Body>
                  </Card>
                </Col>
              );
            })}
          </Row>
        </div>
      ) : (
        <h1>Loading</h1>
      )}
    </>
  );
}

export default UserInfo;
