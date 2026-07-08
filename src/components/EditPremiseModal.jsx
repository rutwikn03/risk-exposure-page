import React, { useState } from 'react';
import FormDropdown from './FormDropdown';
import IntegerField from './IntegerField';

export default function EditPremiseModal({ onClose, locationData, soiRows: initialSoiRows, onSaveLocation, onDeletePremise }) {
  const soiData = initialSoiRows || [];

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

  const handleSave = () => {
    onSaveLocation(locFields);
    onClose();
  };
  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className="edit-modal" onClick={(e) => e.stopPropagation()}>
        {/* Top: Premise Details + Building Details */}
        <div className="edit-modal-top">
          <div className="edit-modal-premise">
            <h2 className="edit-modal-title">Premise Details</h2>
            <div className="edit-modal-card">
              <div className="edit-modal-row">
                <IntegerField label={<>Location Name <span className="req">*</span></>} value={locFields.location.replace(/\D/g, '')} onChange={(v) => updateLocField('location', 'Location ' + v)} />
                <IntegerField label={<>Building Name <span className="req">*</span></>} value={locFields.building.replace(/\D/g, '')} onChange={(v) => updateLocField('building', 'Building ' + v)} />
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

        {/* SOI Read-only Table */}
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
            <span></span>
          </div>
          {soiData.map((row, i) => (
            <div className="soi-grid soi-row soi-row-readonly" key={i}>
              <span>{row.subject}</span>
              <span>{row.amount}</span>
              <span>{row.coins}</span>
              <span>{row.valuation}</span>
              <span>{row.cause}</span>
              <span>{row.inflation}</span>
              <span>{row.ded}</span>
              <span>{row.blkt}</span>
              <span className="soi-forms-text">{row.forms}</span>
              <span></span>
            </div>
          ))}
        </div>

        {/* Footer */}
        <div className="edit-modal-footer">
          <div className="edit-modal-footer-left">
            <button className="btn-cancel" onClick={onClose}>CANCEL</button>
            <img src="/delete premise.svg" alt="Delete Premise" className="delete-premise-btn-img" onClick={onDeletePremise} />
          </div>
          <button className="btn-add-submit" onClick={handleSave}>EDIT</button>
        </div>
      </div>
    </div>
  );
}
