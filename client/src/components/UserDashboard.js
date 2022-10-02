import React from "react";
import { useAuth } from "../context/AuthProvider";
import Tab from "react-bootstrap/Tab";
import Row from "react-bootstrap/esm/Row";
import Col from "react-bootstrap/esm/Col";
import Nav from "react-bootstrap/esm/Nav";
import UserInfo from "./UserInfo";
import TutoringSignup from "./TutoringSignup";
import TeacherDashboard from "./TeacherDashboard"
import OnlineResources from "./OnlineResources"
import SessionSignup from "./SessionSignup";
import AdminControl from "./AdminControl";

function UserDashboard() {
  const userRole = useAuth().currentUser.role;

  return (
    <div>
      <Tab.Container id="left-tabs-example" defaultActiveKey="userHome">
        <Row>
          <Col sm={3}>
            <Nav variant="pills" className="flex-column">
            <Nav.Item>
                <Nav.Link eventKey="userHome">User Home</Nav.Link>
              </Nav.Item>
              {userRole === "tutee" || userRole === "tutor"?
              <Nav.Item>
                <Nav.Link eventKey="dashboard">Dashboard</Nav.Link>
              </Nav.Item>:null
              }
              <Nav.Item>
                <Nav.Link eventKey="tutoringSignup">Tutoring Sign-up</Nav.Link>
              </Nav.Item>
              <Nav.Item>
                <Nav.Link eventKey="onlineResources">Online Resources</Nav.Link>
              </Nav.Item>
              <Nav.Item></Nav.Item>
              {userRole === "tutor"?
                <Nav.Item>
                <Nav.Link eventKey="sessionSignup">Session Signup</Nav.Link>
              </Nav.Item>:null
              }
              {userRole === "teacher" || userRole === "admin"?
                <Nav.Item>
                <Nav.Link eventKey="teacherDashboard">Teacher Dashboard</Nav.Link>
              </Nav.Item>:null
              }
              {userRole === "admin"?
              <Nav.Item>
                <Nav.Link eventKey="adminControl">Admin Control</Nav.Link>
              </Nav.Item>: null
              }
            </Nav>
          </Col>
          <Col sm={9}>
            <Tab.Content>
            <Tab.Pane eventKey="userHome">
                <h1>User Home</h1>
              </Tab.Pane>
              <Tab.Pane eventKey="dashboard">
                <UserInfo />
              </Tab.Pane>
              <Tab.Pane eventKey="tutoringSignup">
                <TutoringSignup />
              </Tab.Pane>
              <Tab.Pane eventKey="sessionSignup">
                <SessionSignup />
              </Tab.Pane>
              <Tab.Pane eventKey="teacherDashboard">
                <TeacherDashboard />
              </Tab.Pane>
              <Tab.Pane eventKey="adminControl">
                <AdminControl />
              </Tab.Pane>
              <Tab.Pane eventKey="onlineResources">
                <OnlineResources />
              </Tab.Pane>
            </Tab.Content>
          </Col>
        </Row>
      </Tab.Container>
    </div>
  );
}

export default UserDashboard;
