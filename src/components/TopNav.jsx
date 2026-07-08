import React from 'react';

export default function TopNav() {
  return (
    <div className="top-nav">
      <div className="top-nav-left">
        <img src="/Appian_Logo.svg" alt="Appian" className="appian-logo-img" />
        <nav className="nav-links">
          <a className="nav-link" href="#">MY WORKBENCH</a>
          <a className="nav-link active" href="#">SUBMISSIONS</a>
          <a className="nav-link" href="#">PARTIES</a>
          <a className="nav-link" href="#">MESSAGES</a>
          <a className="nav-link" href="#">REPORTS</a>
        </nav>
      </div>
      <div className="top-nav-right">
        <span className="connected-label">Connected Underwriting</span>
        <span className="connected-arrow">▾</span>
        <span className="user-initials">AU</span>
        <img src="/Appian_Logo.svg" alt="Appian" className="appian-logo-img" />
      </div>
    </div>
  );
}
