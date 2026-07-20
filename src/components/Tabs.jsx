import React from 'react';

const tabs = ['Summary', 'Submission Docs', 'Risk Details', 'Messages', 'Sanctions Check', 'Related Actions'];

export default function Tabs({ activeTab, onTabChange }) {
  return (
    <div className="tabs-section">
      {tabs.map((tab) => (
        <a
          key={tab}
          className={`tab${tab === (activeTab || 'Risk Details') ? ' active' : ''}`}
          href="#"
          onClick={(e) => { e.preventDefault(); onTabChange && onTabChange(tab); }}
        >
          {tab}
        </a>
      ))}
    </div>
  );
}
