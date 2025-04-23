import React from "react";
import { Link } from "react-router-dom";

const Landing = () => {
  return (
    <div className="landing">
      <div className="left">
        <div className="logo">
          <img src="logo.png" alt="Logo" />
        </div>

        <div className="title-large">Blockchain Based</div>
        <div className="title-large">Voting System</div>
        <div className="title-small">The Future of Voting</div>

        <div className="button-wrapper">
          <Link to="/login">
            <button className="button-black">Login</button>
          </Link>

          <Link to="/view">
            <button className="button-white">View Votes</button>
          </Link>
        </div>
      </div>

      <div className="right">
        <img src="vote.gif" alt="Voting Animation" />
      </div>
    </div>
  );
};

export default Landing;
