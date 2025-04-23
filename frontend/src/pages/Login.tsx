import React, { useState, useContext } from "react";
import { useNavigate } from "react-router";
import { Formik } from "formik";
import { RouteProps } from "react-router";
import LoginLayout from "../layouts/Login";
import * as Yup from "yup";
import axios from "../axios";
import { AuthContext } from "../contexts/Auth";

const schema = Yup.object().shape({
  email: Yup.string().email("Invalid email").required("Required"),
  password: Yup.string().min(3).required("Required"),
});

const Login = (props: RouteProps): JSX.Element => {
  const navigate = useNavigate();
  const authContext = useContext(AuthContext);

  const [error, setError] = useState<any>("");

  return (
    <div className="login-page">
      <LoginLayout error={error}>
        <div className="form-container">
          <h2 className="form-title">Welcome Back</h2>
          <p className="form-subtitle">Login to access your account</p>

          <Formik
            initialValues={{
              email: "",
              password: "",
            }}
            validationSchema={schema}
            onSubmit={(values) => {
              axios
                .post("/auth/login", { ...values })
                .then((res) => {
                  authContext.authenticate(res.data.user, res.data.accessToken);
                })
                .catch((err) => {
                  let error = err.message;
                  if (err?.response?.data)
                    error = JSON.stringify(err.response.data);
                  setError(error);
                });
            }}
          >
            {({ errors, touched, getFieldProps, handleSubmit }) => (
              <form onSubmit={handleSubmit} className="login-form">
                <div className="input-container">
                  <input
                    id="email"
                    type="email"
                    placeholder="Email"
                    {...getFieldProps("email")}
                  />
                  <div className="form-error-text">
                    {touched.email && errors.email ? errors.email : null}
                  </div>
                </div>

                <div className="input-container">
                  <input
                    id="password"
                    type="password"
                    placeholder="Password"
                    {...getFieldProps("password")}
                  />
                  <div className="form-error-text">
                    {touched.password && errors.password
                      ? errors.password
                      : null}
                  </div>
                </div>

                <button className="login-button button-primary" type="submit">
                  Login
                </button>
              </form>
            )}
          </Formik>

          <div className="form-info-text">
            <a href="/forgot-password">Forgot Password?</a>
          </div>

          <hr />

          <button
            onClick={() => navigate("/signup")}
            className="button-secondary"
          >
            Create a New Account
          </button>
        </div>
      </LoginLayout>
    </div>
  );
};

export default Login;
