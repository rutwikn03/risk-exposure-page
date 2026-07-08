import React from 'react';

export default function SubTabs({ activeSubTab, onChangeSubTab }) {
  return (
    <div className="sub-tabs">
      <a
        className={`sub-tab${activeSubTab === 'loss' ? ' active' : ''}`}
        href="#"
        onClick={(e) => { e.preventDefault(); onChangeSubTab('loss'); }}
      >
        Loss History
      </a>
      <a
        className={`sub-tab${activeSubTab === 'risk' ? ' active' : ''}`}
        href="#"
        onClick={(e) => { e.preventDefault(); onChangeSubTab('risk'); }}
      >
        Risk Exposure
      </a>
    </div>
  );
}
