import React, { useState } from 'react';
import { CloseIcon, CloneIcon } from './Icons';
import SoiDropdown from './SoiDropdown';
import FormDropdown from './FormDropdown';
import IntegerField from './IntegerField';

export default function EditDetailsModal({ onClose, locationData, soiRows: initialSoiRows, onSaveLocation, onSaveSoi, onDeletePremise }) {
  const [showDeleteWarning, setShowDeleteWarning] = useState(false);
  const [showRemoveSoi, setShowRemoveSoi] = useState(null); // index of row to remove
  const [soiRows, setSoiRows] = useState([
    { subject: '', amount: '', coins: '', valuation: '', cause: '', inflation: '', ded: '-', blkt: '', forms: '' },
    ...initialSoiRows.map(r => ({ ...r })),
  ]);

  const [locFields, setLocFields] = useState({
    location: locationData.location,
    building: locationData.building,
    street: locationData.street,
    city: locationData.city,
    state: locationData.state,
    country: locationData.country,
    zip: locationData.zip,
    constructionType: locationData.constructionType,
    roofingYear: locationData.roofingYear,
    yearBuilt: locationData.yearBuilt,
  });

  const updateLocField = (field, value) => {
    setLocFields(prev => ({ ...prev, [field]: value }));
  };

  const addSoiRow = () => {
    setSoiRows([{ subject: '', amount: '', coins: '', valuation: '', cause: '', inflation: '', ded: '-', blkt: '', forms: '' }, ...soiRows]);
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

  const handleSave = () => {
    // Save location fields
    onSaveLocation(locFields);
    // Save SOI data (filter out completely empty rows)
    const filledRows = soiRows.filter(r => r.subject || r.amount || r.valuation);
    onSaveSoi(filledRows);
    onClose();
  };

  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className="edit-modal" onClick={(e) => e.stopPropagation()}>
        <div className="edit-modal-header">
          <h1 className="modal-main-heading">Edit Details</h1>
        </div>
        <div className="edit-modal-body">
        {/* Top: Premise Details + Building Details */}
        <div className="edit-modal-top">
          <div className="edit-modal-premise">
            <h2 className="edit-modal-title">Premise Details</h2>
            <div className="edit-modal-card">
              <div className="edit-modal-row">
                <IntegerField label={<>Location Name <span className="req">*</span></>} value={locFields.location.replace(/\D/g, '')} onChange={(v) => updateLocField('location', 'Location ' + v)} style={{ width: 240 }} />
                <IntegerField label={<>Building Name <span className="req">*</span></>} value={locFields.building.replace(/\D/g, '')} onChange={(v) => updateLocField('building', 'Building ' + v)} style={{ width: 240 }} />
              </div>
              <div className="edit-modal-row">
                <div className="edit-modal-field" style={{ flex: 1 }}>
                  <label>Street Address <span className="req">*</span></label>
                  <input type="text" value={locFields.street} onChange={(e) => updateLocField('street', e.target.value)} />
                </div>
              </div>
              <div className="edit-modal-row">
                <div className="edit-modal-field" style={{ width: 200 }}>
                  <label>City <span className="req">*</span></label>
                  <input type="text" value={locFields.city} onChange={(e) => updateLocField('city', e.target.value)} />
                </div>
                <div className="edit-modal-field" style={{ width: 220 }}>
                  <label>State <span className="req">*</span></label>
                  <input type="text" value={locFields.state} onChange={(e) => updateLocField('state', e.target.value)} />
                </div>
                <div className="edit-modal-field" style={{ width: 260 }}>
                  <label>Country <span className="req">*</span></label>
                  <input type="text" value={locFields.country} onChange={(e) => updateLocField('country', e.target.value)} />
                </div>
                <div className="edit-modal-field" style={{ width: 180 }}>
                  <label>Zip Code <span className="req">*</span></label>
                  <input type="text" value={locFields.zip} onChange={(e) => updateLocField('zip', e.target.value)} />
                </div>
              </div>
            </div>
          </div>
          <div className="edit-modal-building">
            <h2 className="edit-modal-title">Building Details</h2>
            <div className="edit-modal-card">
              <div className="edit-modal-field">
                <label>Construction Type <span className="req">*</span></label>
                <FormDropdown type="constructionType" value={locFields.constructionType} onChange={(v) => updateLocField('constructionType', v)} />
              </div>
              <div className="edit-modal-field">
                <label>Bld. Improvement Roofing Yr. <span className="req">*</span></label>
                <input type="text" value={locFields.roofingYear} onChange={(e) => updateLocField('roofingYear', e.target.value)} />
              </div>
              <div className="edit-modal-field">
                <label>Yr. Built <span className="req">*</span></label>
                <input type="text" value={locFields.yearBuilt} onChange={(e) => updateLocField('yearBuilt', e.target.value)} />
              </div>
            </div>
          </div>
        </div>

        {/* SOI Section */}
        <div className="soi-section-header">
          <span className="soi-section-title">Subjects of Insurance</span>
          <img src="/add subject of insurance.svg" alt="ADD Subject of Insurance" className="add-soi-btn-img" onClick={addSoiRow} />
        </div>
        <div className="edit-modal-soi">

          <div className="soi-grid soi-header">
            <span>Subject of Insurance <span className="req">*</span></span>
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

          {soiRows.map((row, i) => (
            <div className="soi-grid soi-row" key={i}>
              <SoiDropdown type="subject" value={row.subject} onChange={(v) => updateRow(i, 'subject', v)} />
              <input type="text" value={row.amount} onChange={(e) => updateRow(i, 'amount', e.target.value)} placeholder="Enter Value" />
              <input type="text" value={row.coins} onChange={(e) => updateRow(i, 'coins', e.target.value)} />
              <SoiDropdown type="valuation" value={row.valuation} onChange={(v) => updateRow(i, 'valuation', v)} />
              <SoiDropdown type="cause" value={row.cause} onChange={(v) => updateRow(i, 'cause', v)} />
              <input type="text" value={row.inflation} onChange={(e) => updateRow(i, 'inflation', e.target.value)} placeholder="Enter Value" />
              <input type="text" value={row.ded} onChange={(e) => updateRow(i, 'ded', e.target.value)} />
              <input type="text" value={row.blkt} onChange={(e) => updateRow(i, 'blkt', e.target.value)} />
              <input type="text" value={row.forms} onChange={(e) => updateRow(i, 'forms', e.target.value)} placeholder="Enter Value" className="soi-forms-input" />
              <span className="soi-actions">
                <CloneIcon onClick={() => cloneRow(i)} />
                <CloseIcon onClick={() => setShowRemoveSoi(i)} />
              </span>
            </div>
          ))}
        </div>

        </div>
        {/* end edit-modal-body */}

        {/* Footer */}
        <div className="edit-modal-footer">
          <button className="btn-cancel" onClick={onClose}>CANCEL</button>
          <button className="btn-add-submit" onClick={handleSave}>EDIT</button>
        </div>

        {/* Delete Warning */}
        {showDeleteWarning && (
          <div className="modal-overlay" style={{ position: 'fixed' }} onClick={() => setShowDeleteWarning(false)}>
            <div className="delete-warning-modal" onClick={(e) => e.stopPropagation()} style={{ position: 'relative' }}>
              <img src="/delete warning.svg" alt="Delete Warning" className="warning-img" />
              <div className="warning-btn-overlay">
                <div className="warning-btn-cancel" onClick={() => setShowDeleteWarning(false)}></div>
                <div className="warning-btn-delete" onClick={() => { setShowDeleteWarning(false); onDeletePremise(); }}></div>
              </div>
            </div>
          </div>
        )}

        {/* Remove SOI Warning */}
        {showRemoveSoi !== null && (
          <div className="modal-overlay" style={{ position: 'fixed' }} onClick={() => setShowRemoveSoi(null)}>
            <div className="delete-warning-modal" onClick={(e) => e.stopPropagation()} style={{ position: 'relative' }}>
              <img src="/remove soi.svg" alt="Remove SOI Warning" className="warning-img" />
              <div className="warning-btn-overlay">
                <div className="warning-btn-cancel" onClick={() => setShowRemoveSoi(null)}></div>
                <div className="warning-btn-delete" onClick={() => { removeSoiRow(showRemoveSoi); setShowRemoveSoi(null); }}></div>
              </div>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}
