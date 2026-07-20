import React, { useState, useRef, useEffect } from 'react';

export default function TopNav({ activePage, onChangePage }) {
  const [open, setOpen] = useState(false);
  const ref = useRef(null);

  useEffect(() => {
    function handleClick(e) {
      if (ref.current && !ref.current.contains(e.target)) setOpen(false);
    }
    document.addEventListener('mousedown', handleClick);
    return () => document.removeEventListener('mousedown', handleClick);
  }, []);

  const label = activePage === 'commercial-auto' ? 'Commercial Automobile' : 'Commercial Property';

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
        <div className="product-dropdown" ref={ref}>
          <button className="product-dropdown-btn" onClick={() => setOpen(!open)}>
            <span>{label}</span>
            <span className="product-dropdown-arrow">▾</span>
          </button>
          {open && (
            <div className="product-dropdown-menu">
              <div
                className={`product-dropdown-option${activePage === 'real-estate' ? ' active' : ''}`}
                onClick={() => { onChangePage('real-estate'); setOpen(false); }}
              >
                Commercial Property
              </div>
              <div
                className={`product-dropdown-option${activePage === 'commercial-auto' ? ' active' : ''}`}
                onClick={() => { onChangePage('commercial-auto'); setOpen(false); }}
              >
                Commercial Automobile
              </div>
            </div>
          )}
        </div>
        <span className="user-initials">AU</span>
        <img src="/Appian_Logo.svg" alt="Appian" className="appian-logo-img" />
      </div>
    </div>
  );
}
