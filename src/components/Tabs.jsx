import React from 'react';

const tabs = ['Summary', 'Submission Docs', 'Risk Details', 'Messages', 'Sanctions Check', 'Related Actions'];

export default function Tabs() {
  return (
    <div className="tabs-section">
      {tabs.map((tab) => (
        <a key={tab} className={`tab${tab === 'Risk Details' ? ' active' : ''}`} href="#">
          {tab}
        </a>
      ))}
    </div>
  );
}
