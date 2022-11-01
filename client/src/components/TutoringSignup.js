import React, { useState, useEffect } from "react";
import { format } from "date-fns";
import Container from "react-bootstrap/esm/Container";
import Row from "react-bootstrap/esm/Row";
import Col from "react-bootstrap/esm/Col";

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

  

  return (
    <h1>Working on it</h1>
  );
}

export default TutoringSignup;
