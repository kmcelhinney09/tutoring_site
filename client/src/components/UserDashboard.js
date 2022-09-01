import React from "react";
import { useAuth } from "../context/AuthProvider";
import Tab from "react-bootstrap/Tab";
import Row from "react-bootstrap/esm/Row";
import Col from "react-bootstrap/esm/Col";
import Nav from "react-bootstrap/esm/Nav";
import UserInfo from "./UserInfo";
import TutoringSignup from "./TutoringSignup";
import TeacherDashboard from "./TeacherDashboard"

function UserDashboard() {
  const auth = useAuth();

  return (
    <div>
      <Tab.Container id="left-tabs-example" defaultActiveKey="dashboard">
        <Row>
          <Col sm={3}>
            <Nav variant="pills" className="flex-column">
              <Nav.Item>
                <Nav.Link eventKey="dashboard">Dashboard</Nav.Link>
              </Nav.Item>
              <Nav.Item>
                <Nav.Link eventKey="tutoringSignup">Tutoring Sign-up</Nav.Link>
              </Nav.Item>
              {auth.currentUser.role !== "tutee"?
                <Nav.Item>
                <Nav.Link eventKey="sessionSignup">Session Signup</Nav.Link>
              </Nav.Item>:null
              }
              {auth.currentUser.role === "teacher" || auth.currentUser.role === "admin"?
                <Nav.Item>
                <Nav.Link eventKey="teacherDashboard">Teacher Dashboard</Nav.Link>
              </Nav.Item>:null
              }
              {auth.currentUser.role === "admin"?
              <Nav.Item>
                <Nav.Link eventKey="adminControl">Tutoring Sign-up</Nav.Link>
              </Nav.Item>: null
              }
            </Nav>
          </Col>
          <Col sm={9}>
            <Tab.Content>
              <Tab.Pane eventKey="dashboard">
                <UserInfo />
              </Tab.Pane>
              <Tab.Pane eventKey="tutoringSignup">
                <TutoringSignup />
              </Tab.Pane>
              <Tab.Pane eventKey="sessionSignup">
                <UserInfo />
              </Tab.Pane>
              <Tab.Pane eventKey="teacherDashboard">
                <TeacherDashboard />
              </Tab.Pane>
              <Tab.Pane eventKey="adminControl">
                <TutoringSignup />
              </Tab.Pane>
            </Tab.Content>
          </Col>
        </Row>
      </Tab.Container>
    </div>
  );
}

export default UserDashboard;
