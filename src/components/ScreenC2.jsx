import React, { useState } from 'react';
import { HardHatIcon, HouseDamageIcon, ToolsIcon, CloseIcon, CloneIcon } from './Icons';
import SoiDropdown from './SoiDropdown';

export default function ScreenC2({ locationName, locationData, soiData, onGoBack, onEditDetails, onSaveSoi, onDeletePremise }) {
  const [showAddSoi, setShowAddSoi] = useState(false);
  const [showDeleteWarning, setShowDeleteWarning] = useState(false);

  const address = `${locationData.street}, ${locationData.city}, ${locationData.state}, ${locationData.country}, ${locationData.zip}`;

  return (
    <div className="detail-view">
      {/* Detail Header */}
      <div className="detail-header">
        <div className="detail-header-top">
          <div>
            <div className="location-title">{locationData.location} | {locationData.building}</div>
            <div className="location-address">{address}</div>
          </div>
          <div className="detail-header-top-right">
            <img src="/delete_premise.svg" alt="Delete Premise" className="header-action-img" onClick={() => setShowDeleteWarning(true)} title="Delete this premise and all associated coverages" />
            <img src="/edit details.svg" alt="Edit Details" className="header-action-img" onClick={onEditDetails} title="Edit premise details, building info, and coverages" />
          </div>
        </div>
        {/* Info Cards */}
        <div className="detail-header-bottom">
          <div className="info-cards">
            <div className="info-card">
              <HardHatIcon />
              <div>
                <div className="info-card-label">Construction Type</div>
                <div className="info-card-value">{locationData.constructionType}</div>
              </div>
            </div>
            <div className="info-card">
              <HouseDamageIcon />
              <div>
                <div className="info-card-label">Bld. Improvement Roofing Year</div>
                <div className="info-card-value">{locationData.roofingYear}</div>
              </div>
            </div>
            <div className="info-card">
              <ToolsIcon />
              <div>
                <div className="info-card-label">Year Built</div>
                <div className="info-card-value">{locationData.yearBuilt}</div>
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Detail Table */}
      <div className="detail-table-section">
        <div className="detail-table-header-row">
          <span className="detail-table-heading">Property Coverages</span>
          <img src="/add coverage.svg" alt="Add Coverage" className="add-coverage-btn" onClick={() => setShowAddSoi(true)} title="Add a new subject of insurance coverage to this premise" />
        </div>
        <table className="detail-table">
          <thead>
            <tr>
              <th>Subject of Insurance</th>
              <th>Amount</th>
              <th>Coins %</th>
              <th>Valuation</th>
              <th>Cause of Loss</th>
              <th>Inflation Guard</th>
              <th>DED</th>
              <th>BLKT#</th>
              <th>Forms &amp; Conditions to Apply</th>
            </tr>
          </thead>
          <tbody>
            {soiData.map((row, i) => (
              <tr key={i}>
                <td>{row.subject}</td>
                <td>{row.amount}</td>
                <td>{row.coins}</td>
                <td>{row.valuation}</td>
                <td>{row.cause}</td>
                <td>{row.inflation}</td>
                <td className="center-cell">{row.ded}</td>
                <td className="center-cell">{row.blkt}</td>
                <td className="see-more-cell">
                  {row.forms}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      {/* Add SOI Modal */}
      {showAddSoi && <AddSoiModal locationData={locationData} existingSoi={soiData} onClose={() => setShowAddSoi(false)} onSave={onSaveSoi} />}

      {/* Delete Warning Modal */}
      {showDeleteWarning && (
        <div className="modal-overlay" onClick={() => setShowDeleteWarning(false)}>
          <div className="delete-warning-modal" onClick={(e) => e.stopPropagation()} style={{ position: 'relative' }}>
            <img src="/delete warning.svg" alt="Delete Warning" className="warning-img" />
            <div className="warning-btn-overlay">
              <div className="warning-btn-cancel" onClick={() => setShowDeleteWarning(false)}></div>
              <div className="warning-btn-delete" onClick={() => { setShowDeleteWarning(false); onDeletePremise(); }}></div>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

function AddSoiModal({ locationData, existingSoi, onClose, onSave }) {
  const [soiRows, setSoiRows] = useState([
    { subject: '', amount: '', coins: '', valuation: '', cause: '', inflation: '', ded: '-', blkt: '', forms: '' }
  ]);

  const addSoiRow = () => {
    setSoiRows([...soiRows, { subject: '', amount: '', coins: '', valuation: '', cause: '', inflation: '', ded: '-', blkt: '', forms: '' }]);
  };

  const cloneRow = (index) => {
    const cloned = { ...soiRows[index] };
    const newRows = [...soiRows];
    newRows.splice(index + 1, 0, cloned);
    setSoiRows(newRows);
  };

  const removeSoiRow = (index) => {
    if (soiRows.length > 1) {
      setSoiRows(soiRows.filter((_, i) => i !== index));
    }
  };

  const updateRow = (index, field, value) => {
    const newRows = [...soiRows];
    if (field === 'amount') {
      const numericVal = value.replace(/[\s$]+/g, '').replace(/[^0-9,.]/g, '');
      newRows[index] = { ...newRows[index], [field]: numericVal ? numericVal + ' $' : '' };
    } else {
      newRows[index] = { ...newRows[index], [field]: value };
    }
    setSoiRows(newRows);
  };

  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className="edit-modal" onClick={(e) => e.stopPropagation()}>
        <div className="edit-modal-header">
          <h1 className="modal-main-heading">Add Coverage</h1>
        </div>
        <div className="edit-modal-body">
        <h2 className="edit-modal-title">Premise Details</h2>

        {/* Location info */}
        <div className="add-premise-location-header">
          <h3 className="add-premise-location-name">{locationData.location} | {locationData.building}</h3>
          <p className="add-premise-address">{locationData.street}, {locationData.city}, {locationData.state}, {locationData.country}, {locationData.zip}</p>
        </div>

        {/* Info cards */}
        <div className="info-cards" style={{ marginTop: 0, marginBottom: 16 }}>
          <div className="info-card">
            <HardHatIcon />
            <div>
              <div className="info-card-label">Construction Type</div>
              <div className="info-card-value">{locationData.constructionType}</div>
            </div>
          </div>
          <div className="info-card">
            <HouseDamageIcon />
            <div>
              <div className="info-card-label">Bld. Improvement Roofing Year</div>
              <div className="info-card-value">{locationData.roofingYear}</div>
            </div>
          </div>
          <div className="info-card">
            <ToolsIcon />
            <div>
              <div className="info-card-label">Year Built</div>
              <div className="info-card-value">{locationData.yearBuilt}</div>
            </div>
          </div>
        </div>

        {/* SOI Section */}
        <div className="soi-section-header">
          <span className="soi-section-title">Subjects of Insurance</span>
          <img src="/add subject of insurance.svg" alt="ADD Subject of Insurance" className="add-soi-btn-img" onClick={addSoiRow} />
        </div>
        <div className="edit-modal-soi">

          {/* Column headers */}
          <div className="soi-grid soi-header">
            <span>Subject of Insurance</span>
            <span>Amount</span>
            <span>Coins %</span>
            <span>Valuation</span>
            <span>Cause of Losses</span>
            <span>Inflation Guard</span>
            <span>DED</span>
            <span>#BLKT</span>
            <span>Terms and Conditions to Apply</span>
            <span>Actions</span>
          </div>

          {/* Rows */}
          {soiRows.map((row, i) => (
            <div className="soi-grid soi-row" key={i}>
              <SoiDropdown type="subject" value={row.subject} onChange={(v) => updateRow(i, 'subject', v)} />
              <input type="text" value={row.amount} onChange={(e) => updateRow(i, 'amount', e.target.value)} placeholder="Enter a value" />
              <input type="text" value={row.coins} onChange={(e) => updateRow(i, 'coins', e.target.value)} />
              <SoiDropdown type="valuation" value={row.valuation} onChange={(v) => updateRow(i, 'valuation', v)} />
              <SoiDropdown type="cause" value={row.cause} onChange={(v) => updateRow(i, 'cause', v)} />
              <input type="text" value={row.inflation} onChange={(e) => updateRow(i, 'inflation', e.target.value)} placeholder="Enter a value" />
              <input type="text" value={row.ded} onChange={(e) => updateRow(i, 'ded', e.target.value)} placeholder="-" />
              <input type="text" value={row.blkt} onChange={(e) => updateRow(i, 'blkt', e.target.value)} />
              <input type="text" value={row.forms} onChange={(e) => updateRow(i, 'forms', e.target.value)} placeholder="Enter a value" />
              <span className="soi-actions">
                <CloneIcon onClick={() => cloneRow(i)} />
                <CloseIcon onClick={() => removeSoiRow(i)} />
              </span>
            </div>
          ))}
        </div>
        </div>

        {/* Footer */}
        <div className="edit-modal-footer">
          <button className="btn-cancel" onClick={onClose}>CANCEL</button>
          <button className="btn-add-submit" onClick={() => {
            // Merge new rows with existing SOI data
            const filledRows = soiRows.filter(r => r.subject || r.amount || r.valuation);
            onSave([...existingSoi, ...filledRows]);
            onClose();
          }}>ADD</button>
        </div>
      </div>
    </div>
  );
}
