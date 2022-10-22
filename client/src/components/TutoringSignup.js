import React, { useState, useEffect } from "react";

import Container from "react-bootstrap/esm/Container";
import Row from "react-bootstrap/esm/Row";
import Col from "react-bootstrap/esm/Col";

function TutoringSignup() {
  useEffect(() => {
    fetch("/tutoring_time_slots").then((res) => {
      if (res.ok) {
        res.json().then((data) => {
          console.log(data);
        });
      }
    });
  }, []);

  const locations = [
    {
      location_name: "Falconholt Campus Hall",
      location_time_slots: [
        {
          room_name: "Room number: 262",
          date: "10/12/22",
          start: "8:00am",
          end: "12:00pm",
          num_tutors: 2,
          open_slots: 5,
        },
        {
          room_name: "Room number: 22",
          date: "10/12/22",
          start: "10:00am",
          end: "12:00pm",
          num_tutors: 4,
          open_slots: 4,
        },
      ],
    },
    {
      location_name: "Icelyn Campus Hall",
      location_time_slots: [
        {
          room_name: "Room number: 200",
          date: "10/12/22",
          start: "8:00am",
          end: "12:00pm",
          num_tutors: 3,
          open_slots: 15,
        },
      ],
    },
  ];

  return (
    <Container>
      <Row>
        <h1>Tutorting Sign UP!!!! YO</h1>
      </Row>
      {locations.map((location) => {
        return (
          <Row>
            <h3>{location.location_name}</h3>
            <Row>
              {location.location_time_slots.map((slot) => {
                return (
                  <Row>
                    <Col>{slot.room_name}</Col>
                    <Col>Time Slot</Col>
                    <Col>Number of Tutors</Col>
                    <Col>Number of Open Slots</Col>
                    <Row>
                      <Col></Col>
                      <Col>
                        {slot.date + " (" + slot.start + " - " + slot.end + ")"}
                      </Col>
                      <Col>{slot.num_tutors}</Col>
                      <Col>{slot.open_slots}</Col>
                    </Row>
                  </Row>
                );
              })}
            </Row>
          </Row>
        );
      })}
    </Container>
  );
}

export default TutoringSignup;
