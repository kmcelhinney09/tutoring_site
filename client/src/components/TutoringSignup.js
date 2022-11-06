import React, { useState, useEffect } from "react";
import Container from "react-bootstrap/esm/Container";
import Row from "react-bootstrap/esm/Row";
import Col from "react-bootstrap/esm/Col";
import Table from "react-bootstrap/Table";

function TutoringSignup({ school_id }) {
  console.log(school_id);
  const [tutoringInfo, setTutoringInfo] = useState(false);

  useEffect(() => {
    fetch(`/school/${school_id}/tutoring`).then((res) => {
      if (res.ok) {
        res.json().then((data) => {
          console.log(data);
          setTutoringInfo(data);
        });
      }
    });
  }, [school_id]);

  function tutoring_slots(slot_info) {
    let slot_status;

    if (slot_info.booked_status === false) {
      slot_status = 'Sign-up'
    } else {
      slot_status = 'Full'
    }
    return (
      <tr>
          <td>{slot_info.date}</td>
          <td>{slot_info.start_time}</td>
          <td>{slot_info.end_time}</td>
          <td>{slot_status}</td>
        </tr>
    )
  }
  return (
    <>
      {tutoringInfo ? (
        <Container>
          <Row>
            <h1>{tutoringInfo.school_name}</h1>
          </Row>
          <Row>
            <Row>
              {tutoringInfo.locations.map((location) => {
                return (
                  <Row key={location.id}>
                    <h3>{location.building}</h3>
                    <Row>
                      <h6>{location.name}</h6>
                    </Row>
                    <Row>
                      <Table>
                        <thead>
                          <tr>
                            <th>Session</th>
                            <th>Start Time</th>
                            <th>End Time</th>
                            <th>Status</th>
                          </tr>
                        </thead>
                        <tbody>
                          {tutoringInfo.tutoring_time_slots.map((slot) => {
                            return (
                              <>
                                {slot.location_id == location.id ? (
                                  tutoring_slots(slot)
                                ) : null}
                              </>
                            );
                          })}
                        </tbody>
                      </Table>
                    </Row>
                  </Row>
                );
              })}
            </Row>
          </Row>
        </Container>
      ) : (
        <h1>Loading....</h1>
      )}
    </>
  );
}

export default TutoringSignup;
