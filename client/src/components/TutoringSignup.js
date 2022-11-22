import React, { useState, useEffect } from "react";
import { useAuth } from "../context/AuthProvider";
import Container from "react-bootstrap/esm/Container";
import Row from "react-bootstrap/esm/Row";
import Table from "react-bootstrap/Table";
import Button from "react-bootstrap/Button";

function TutoringSignup({ school_id }) {
  const [tutoringInfo, setTutoringInfo] = useState(false);
  const userId = useAuth().currentUser.id;

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

  function book_tutoring(sessionInfo) {
    console.log(userId, sessionInfo);
  }

  function tutoring_slots(slot_info) {
    let slot_status;
    let slot_return;

    slot_return = slot_info.tutors.map((tutor) => {
      if (slot_info.booked_status === false) {
        slot_status = (
          <td>
            <Button onClick={() => book_tutoring(slot_info)}>Sign-up</Button>
          </td>
        );
      } else {
        slot_status = <td className="text-danger">Full</td>;
      }
      return (
        <tr key={slot_info.id}>
          <td className="text-center">{slot_info.date}</td>
          <td className="text-center">{tutor.full_name}</td>
          <td className="text-center">{slot_info.subjects_covered}</td>
          <td className="text-center">{slot_info.start_time}</td>
          <td className="text-center">{slot_info.end_time}</td>
          <td className="text-center">{slot_info.tutee_space}</td>
          {slot_status}
        </tr>
      );
    });
    return slot_return;
  }
  return (
    <>
      {tutoringInfo ? (
        <Container>
          <Row>
            <h1>{tutoringInfo.school_name}</h1>
          </Row>
          <Row>
            {tutoringInfo.locations.map((buildings) => {
              return (
                <Row key={buildings[0]}>
                  <h3>{buildings[0]}</h3>
                  {buildings[1].map((building_location) => {
                    return (
                      <Row key={building_location.id}>
                        <Row>
                          <h6>{building_location.name}</h6>
                        </Row>
                        <Row>
                          <Table responsive="md">
                            <thead>
                              <tr>
                                <th className="text-center">Session</th>
                                <th className="text-center">Tutor</th>
                                <th className="text-center">
                                  Subjects Covered
                                </th>
                                <th className="text-center">Start Time</th>
                                <th className="text-center">End Time</th>
                                <th className="text-center">Open Slots</th>
                                <th className="text-center">Status</th>
                              </tr>
                            </thead>

                            {tutoringInfo.tutoring_time_slots.map((slot) => {
                              return (
                                <tbody key={slot.id}>
                                  {slot.location_id == building_location.id
                                    ? tutoring_slots(slot)
                                    : null}
                                </tbody>
                              );
                            })}
                          </Table>
                        </Row>
                      </Row>
                    );
                  })}
                </Row>
              );
            })}
          </Row>
        </Container>
      ) : (
        <h1>Loading....</h1>
      )}
    </>
  );
}

export default TutoringSignup;
