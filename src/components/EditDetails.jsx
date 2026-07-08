import React from 'react';

const soiRows = [
  { subject: 'Building', amount: '1,986 $', coins: '2.3%', valuation: 'Replacement Cost', cause: 'Basic', inflation: '675', ded: '-', blkt: 'AS3', forms: 'Please fill out the required forms' },
  { subject: 'Building', amount: '1,986 $', coins: '2.3%', valuation: 'Replacement Cost', cause: 'Basic', inflation: '675', ded: '-', blkt: 'AS3', forms: 'Please fill out the required forms' },
  { subject: 'Building', amount: '1,986 $', coins: '2.3%', valuation: 'Replacement Cost', cause: 'Basic', inflation: '675', ded: '-', blkt: 'AS3', forms: 'Please fill out the required forms' },
];

export default function EditDetails({ onCancel }) {
  return (
    <div className="edit-details-page">
      {/* Top section: Premise Details + Building Details */}
      <div className="edit-top-section">
        <div className="edit-premise-section">
          <h2 className="edit-section-title">Premise Details</h2>
          <div className="edit-form-card">
            <div className="edit-form-row">
              <div className="edit-field" style={{ width: 240 }}>
                <label>Location Name <span className="required">*</span></label>
                <input type="text" placeholder="Enter a value" />
              </div>
              <div className="edit-field" style={{ width: 240 }}>
                <label>Building Name <span className="required">*</span></label>
                <input type="text" placeholder="Enter a value" />
              </div>
            </div>
            <div className="edit-form-row">
              <div className="edit-field" style={{ flex: 1 }}>
                <label>Street Address <span className="required">*</span></label>
                <input type="text" placeholder="Enter a value" />
              </div>
            </div>
            <div className="edit-form-row">
              <div className="edit-field" style={{ width: 200 }}>
                <label>City <span className="required">*</span></label>
                <input type="text" placeholder="Enter a value" />
              </div>
              <div className="edit-field" style={{ width: 200 }}>
                <label>State <span className="required">*</span></label>
                <input type="text" placeholder="Enter a value" />
              </div>
              <div className="edit-field" style={{ width: 200 }}>
                <label>Country <span className="required">*</span></label>
                <input type="text" placeholder="Enter a value" />
              </div>
              <div className="edit-field" style={{ width: 200 }}>
                <label>Zip Code <span className="required">*</span></label>
                <input type="text" placeholder="Enter a value" />
              </div>
            </div>
          </div>
        </div>
        <div className="edit-building-section">
          <h2 className="edit-section-title">Building Details</h2>
          <div className="edit-form-card">
            <div className="edit-form-row">
              <div className="edit-field" style={{ flex: 1 }}>
                <label>Construction Type <span className="required">*</span></label>
                <input type="text" placeholder="Enter a value" />
              </div>
            </div>
            <div className="edit-form-row">
              <div className="edit-field" style={{ flex: 1 }}>
                <label>Bld. Improvement Roofing Yr. <span className="required">*</span></label>
                <input type="text" placeholder="Enter a value" />
              </div>
            </div>
            <div className="edit-form-row">
              <div className="edit-field" style={{ flex: 1 }}>
                <label>Yr. Built <span className="required">*</span></label>
                <input type="text" placeholder="Enter a value" />
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* SOI Table Section */}
      <div className="edit-soi-section">
        <a className="add-soi-link" href="#">
          <svg viewBox="0 0 16 16" width="16" height="16" fill="none">
            <circle cx="8" cy="8" r="7" stroke="#2322f0" strokeWidth="1.5" />
            <line x1="8" y1="4" x2="8" y2="12" stroke="#2322f0" strokeWidth="1.5" />
            <line x1="4" y1="8" x2="12" y2="8" stroke="#2322f0" strokeWidth="1.5" />
          </svg>
          ADD Subject of Insurance
        </a>

        <div className="edit-soi-table-wrapper">
          <table className="edit-soi-table">
            <thead>
              <tr>
                <th>Subject of Insurance *</th>
                <th>Amount</th>
                <th>Coins %</th>
                <th>Valuation</th>
                <th>Cause of Losses</th>
                <th>Inflation Guard</th>
                <th>DED</th>
                <th>#BLKT</th>
                <th>Terms and Conditions to Apply</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              {/* Empty input row */}
              <tr>
                <td><input type="text" placeholder="Enter Value" /></td>
                <td><input type="text" placeholder="Enter Value" /></td>
                <td><input type="text" placeholder="" /></td>
                <td><input type="text" placeholder="Enter Value" /></td>
                <td><input type="text" placeholder="Enter Value" /></td>
                <td><input type="text" placeholder="Enter Value" /></td>
                <td><input type="text" placeholder="" /></td>
                <td><input type="text" placeholder="" /></td>
                <td><input type="text" placeholder="Enter Value" /></td>
                <td className="actions-cell">
                  <CloneIcon />
                </td>
              </tr>
              {/* Data rows */}
              {soiRows.map((row, i) => (
                <tr key={i}>
                  <td><input type="text" defaultValue={row.subject} /></td>
                  <td><input type="text" defaultValue={row.amount} /></td>
                  <td><input type="text" defaultValue={row.coins} /></td>
                  <td><input type="text" defaultValue={row.valuation} /></td>
                  <td><input type="text" defaultValue={row.cause} /></td>
                  <td><input type="text" defaultValue={row.inflation} /></td>
                  <td><input type="text" defaultValue={row.ded} /></td>
                  <td><input type="text" defaultValue={row.blkt} /></td>
                  <td className="forms-cell">
                    {row.forms} <span className="see-more">See More...</span>
                  </td>
                  <td className="actions-cell">
                    <CloneIcon />
                    <DeleteIcon />
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>

      {/* Footer buttons */}
      <div className="edit-footer">
        <div className="edit-footer-left">
          <button className="btn-cancel" onClick={onCancel}>CANCEL</button>
          <button className="btn-delete-premise">
            <svg width="14" height="14" viewBox="0 0 14 14" fill="none">
              <path d="M3 4h8l-.5 8.5H3.5L3 4zM5.5 6v5M8.5 6v5M2 4h10M5 4V2.5h4V4" stroke="#2322f0" strokeWidth="1.2" strokeLinecap="round" strokeLinejoin="round"/>
            </svg>
            DELETE PREMISE
          </button>
        </div>
        <button className="btn-edit-submit">EDIT</button>
      </div>
    </div>
  );
}

function CloneIcon() {
  return (
    <svg className="action-icon" width="14" height="14" viewBox="0 0 14 14" fill="none">
      <rect x="4" y="4" width="8" height="8" rx="1" stroke="#666" strokeWidth="1.2" />
      <path d="M10 2H3a1 1 0 0 0-1 1v7" stroke="#666" strokeWidth="1.2" strokeLinecap="round" />
    </svg>
  );
}

function DeleteIcon() {
  return (
    <svg className="action-icon delete" width="14" height="14" viewBox="0 0 14 14" fill="none">
      <line x1="3" y1="3" x2="11" y2="11" stroke="#cc0000" strokeWidth="1.8" strokeLinecap="round" />
      <line x1="11" y1="3" x2="3" y2="11" stroke="#cc0000" strokeWidth="1.8" strokeLinecap="round" />
    </svg>
  );
}
