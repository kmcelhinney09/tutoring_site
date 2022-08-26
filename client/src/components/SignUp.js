import { useState } from "react";
import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";

function SignUp({ closeForm, setCurrentUser }) {
  const [signUpForm, setSignUpForm] = useState({
    email: "",
    full_name: "",
    password: "",
    password_confirmation: "",
  });

  const [errors, setErrors] = useState([]);

  function renderErrors() {
    const error_text = errors.map((error, index) => {
      return (
        <li key={index}>
          {error[0]}
          <ul>
            {error[1].map((text) => (
              <li>{text}</li>
            ))}
          </ul>
        </li>
      );
    });
    return error_text;
  }

  function handleFormOnChange(e) {
    let name = e.target.name;
    let value = e.target.value;
    console.log(name, value);
    setSignUpForm({
      ...signUpForm,
      [name]: value,
    });
  }
  function handleSignUpSubmit(e) {
    e.preventDefault();

    fetch("/users", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(signUpForm),
    }).then((res) => {
      if (res.ok) {
        res.json().then(console.log(res));
      } else {
        // res.json().then((e) => setErrors(Object.entries(e.error)));
        res.json().then((e) => console.log(Object.entries(e.error)));
      }
    });
  }

  return (
    <div className="color-overlay d-flex justify-content-center align-items-center">
      <Form
        className="rounded p-3 p-sm-4"
        onSubmit={(e) => handleSignUpSubmit(e)}
      >
        <Form.Control
          type="email"
          placeholder="Email"
          value={signUpForm.email}
          onChange={handleFormOnChange}
          name="email"
        />
        <Form.Control
          type="text"
          placeholder="Full Name"
          value={signUpForm.full_name}
          onChange={handleFormOnChange}
          name="full_name"
        />
        <Form.Control
          type="password"
          placeholder="Password"
          value={signUpForm.password}
          onChange={handleFormOnChange}
          name="password"
        />
        <Form.Control
          type="password"
          placeholder="Confirm Password"
          value={signUpForm.password_confirmation}
          onChange={handleFormOnChange}
          name="password_confirmation"
        />
        <br />
        <Button variant="primary" type="submit">
          Sign-up
        </Button>{" "}
        <Button variant="primary" onClick={closeForm}>
          Cancel
        </Button>
        <br />
        <Form.Text className="text-danger">
          <ul>{renderErrors()}</ul>
        </Form.Text>
      </Form>
    </div>
  );
}

export default SignUp;
