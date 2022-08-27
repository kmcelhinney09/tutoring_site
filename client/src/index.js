import React from "react";
import ReactDOM from "react-dom";
import "./index.css";
import App from "./App";
import { ProvideAuth } from "./context/AuthProvider";
import "../node_modules/react-bootstrap/dist/react-bootstrap.min.js";
import "../node_modules/bootstrap/dist/css/bootstrap.min.css";

ReactDOM.render(
  <React.StrictMode>
    <ProvideAuth>
      <App />
    </ProvideAuth>
  </React.StrictMode>,
  document.getElementById("root")
);
