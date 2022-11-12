import React, { useState, useEffect } from "react";
import Row from "react-bootstrap/esm/Row";
import Col from "react-bootstrap/esm/Col";
import Card from "react-bootstrap/Card";
import Button from "react-bootstrap/Button";

function OnlineResources({ school_id }) {
  const [resourceInfo, setResourceInfo] = useState(false);

  useEffect(() => {
    fetch(`/school/${school_id}/online_resources`).then((res) => {
      if (res.ok) {
        res.json().then((data) => {
          console.log(data);
          setResourceInfo(data);
        });
      }
    });
  }, [school_id]);

  return (
    <>
      {resourceInfo ? (
        <Row xs={1} md={2} className="g-4">
          {resourceInfo.map((resource) => {
            return (
              <Col md={4}>
                <Card>
                  <Card.Header className="bg-primary text-white">
                    {resource.subject.name}
                  </Card.Header>
                  <Card.Body>
                    <Card.Title>{resource.title}</Card.Title>
                    <Card.Text>{resource.description}</Card.Text>
                    <Card.Link href={resource.url} target="_blank">
                      Resource link
                    </Card.Link>
                  </Card.Body>
                  <Card.Footer>
                    {resource.tags.map((tag) => {
                      return (
                        <Button variant="primary" className="m-2">
                          {tag.title}
                        </Button>
                      );
                    })}
                  </Card.Footer>
                </Card>
              </Col>
            );
          })}
        </Row>
      ) : (
        <h1>Loading....</h1>
      )}
    </>
  );
}

export default OnlineResources;
