import React, { useState } from 'react';
import { CloseIcon, CloneIcon } from './Icons';
import SoiDropdown from './SoiDropdown';
import FormDropdown from './FormDropdown';

export default function AddPremiseModal({ onClose, onAddPremise, allLocations }) {
  const [locFields, setLocFields] = useState({
    location: '', building: '', street: '', city: '', state: '', country: '', zip: '',
    constructionType: '', roofingYear: '', yearBuilt: '',
  });
  const [buildingError, setBuildingError] = useState('');
  const [locNumError, setLocNumError] = useState(false);
  const [bldgNumError, setBldgNumError] = useState(false);

  const [soiRows, setSoiRows] = useState([
    { subject: '', amount: '', coins: '', valuation: '', cause: '', inflation: '', ded: '-', blkt: '', forms: '' }
  ]);

  const updateLocField = (field, value) => {
    setLocFields(prev => ({ ...prev, [field]: value }));
  };

  const handleLocationChange = (val) => {
    if (val !== '' && !/^\d+$/.test(val)) {
      setLocNumError(true);
    } else {
      setLocNumError(false);
    }
    const locName = val ? 'Location ' + val : '';
    updateLocField('location', locName);

    // Auto-populate if location exists
    if (val && /^\d+$/.test(val)) {
      const existing = allLocations.find(l => l.location === 'Location ' + val);
      if (existing) {
        setLocFields(prev => ({
          ...prev,
          location: 'Location ' + val,
          street: existing.street,
          city: existing.city,
          state: existing.state,
          country: existing.country,
          zip: existing.zip,
        }));
      } else {
        setLocFields(prev => ({
          ...prev,
          location: 'Location ' + val,
          street: '', city: '', state: '', country: '', zip: '',
        }));
      }
    }
    // Clear building error when location changes
    setBuildingError('');
  };

  const handleBuildingChange = (val) => {
    if (val !== '' && !/^\d+$/.test(val)) {
      setBldgNumError(true);
    } else {
      setBldgNumError(false);
    }
    const bldgName = val ? 'Building ' + val : '';
    updateLocField('building', bldgName);

    // Validate building uniqueness under this location
    if (val && /^\d+$/.test(val) && locFields.location) {
      const duplicate = allLocations.find(l => l.location === locFields.location && l.building === 'Building ' + val);
      if (duplicate) {
        // Find the next available building number
        const existingNums = allLocations
          .filter(l => l.location === locFields.location)
          .map(l => parseInt(l.building.replace(/\D/g, ''), 10))
          .filter(n => !isNaN(n));
        const nextNum = Math.max(...existingNums) + 1;
        setBuildingError(`A building with this Building Number already exists for the selected location. Next available: ${nextNum}`);
      } else {
        setBuildingError('');
      }
    } else {
      setBuildingError('');
    }
  };

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

  const canSave = locFields.location && locFields.building && !buildingError && !locNumError && !bldgNumError;

  const handleAdd = () => {
    if (!canSave) return;
    const name = `${locFields.location} ${locFields.building}`.trim();
    const newLocation = { ...locFields, name };
    const filledSoi = soiRows.filter(r => r.subject || r.amount || r.valuation);
    onAddPremise(newLocation, filledSoi);
  };

  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className="edit-modal" onClick={(e) => e.stopPropagation()}>
        <div className="edit-modal-header">
          <h1 className="modal-main-heading">Add Premise</h1>
        </div>
        <div className="edit-modal-body">
        {/* Top: Premise Details + Building Details */}
        <div className="edit-modal-top">
          <div className="edit-modal-premise">
            <h2 className="edit-modal-title">Premise Details</h2>
            <div className="edit-modal-card">
              <div className="edit-modal-row">
                <div className="edit-modal-field" style={{ width: 240 }}>
                  <label>Location Number <span className="req">*</span></label>
                  <input
                    type="text"
                    placeholder="Enter location number"
                    value={locFields.location.replace(/\D/g, '')}
                    onChange={(e) => handleLocationChange(e.target.value)}
                    className={locNumError ? 'field-error' : ''}
                  />
                  {locNumError && <span className="field-error-msg">Only integers allowed</span>}
                </div>
                <div className="edit-modal-field" style={{ width: 240 }}>
                  <label>Building Number <span className="req">*</span></label>
                  <input
                    type="text"
                    placeholder="Enter building number"
                    value={locFields.building.replace(/\D/g, '')}
                    onChange={(e) => handleBuildingChange(e.target.value)}
                    className={bldgNumError || buildingError ? 'field-error' : ''}
                  />
                  {bldgNumError && <span className="field-error-msg">Only integers allowed</span>}
                  {buildingError && <span className="field-error-msg">{buildingError}</span>}
                </div>
              </div>
              <div className="edit-modal-row">
                <div className="edit-modal-field" style={{ flex: 1 }}>
                  <label>Street Address <span className="req">*</span></label>
                  <input type="text" placeholder="Enter a value" value={locFields.street} onChange={(e) => updateLocField('street', e.target.value)} />
                </div>
              </div>
              <div className="edit-modal-row">
                <div className="edit-modal-field" style={{ width: 200 }}>
                  <label>City <span className="req">*</span></label>
                  <input type="text" placeholder="Enter a value" value={locFields.city} onChange={(e) => updateLocField('city', e.target.value)} />
                </div>
                <div className="edit-modal-field" style={{ width: 220 }}>
                  <label>State <span className="req">*</span></label>
                  <input type="text" placeholder="Enter a value" value={locFields.state} onChange={(e) => updateLocField('state', e.target.value)} />
                </div>
                <div className="edit-modal-field" style={{ width: 260 }}>
                  <label>Country <span className="req">*</span></label>
                  <input type="text" placeholder="Enter a value" value={locFields.country} onChange={(e) => updateLocField('country', e.target.value)} />
                </div>
                <div className="edit-modal-field" style={{ width: 180 }}>
                  <label>Zip Code <span className="req">*</span></label>
                  <input type="text" placeholder="Enter a value" value={locFields.zip} onChange={(e) => updateLocField('zip', e.target.value)} />
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
                <input type="text" placeholder="Enter a value" value={locFields.roofingYear} onChange={(e) => updateLocField('roofingYear', e.target.value)} />
              </div>
              <div className="edit-modal-field">
                <label>Yr. Built <span className="req">*</span></label>
                <input type="text" placeholder="Enter a value" value={locFields.yearBuilt} onChange={(e) => updateLocField('yearBuilt', e.target.value)} />
              </div>
            </div>
          </div>
        </div>

        {/* SOI Section */}
        <div className="soi-section-header">
          <span className="soi-section-title">Subjects of Insurance</span>
          <img src="/add coverage.svg" alt="ADD Subject of Insurance" className="add-soi-btn-img" onClick={(e) => { e.preventDefault(); addSoiRow(); }} />
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
              <SoiDropdown type="subject" value={row.subject} onChange={(v) => { const newRows = [...soiRows]; newRows[i] = {...newRows[i], subject: v}; setSoiRows(newRows); }} />
              <input type="text" defaultValue={row.amount} placeholder="Enter a value" />
              <input type="text" defaultValue={row.coins} />
              <SoiDropdown type="valuation" value={row.valuation} onChange={(v) => { const newRows = [...soiRows]; newRows[i] = {...newRows[i], valuation: v}; setSoiRows(newRows); }} />
              <SoiDropdown type="cause" value={row.cause} onChange={(v) => { const newRows = [...soiRows]; newRows[i] = {...newRows[i], cause: v}; setSoiRows(newRows); }} />
              <input type="text" defaultValue={row.inflation} placeholder="Enter a value" />
              <input type="text" defaultValue={row.ded} placeholder="-" />
              <input type="text" defaultValue={row.blkt} />
              <input type="text" defaultValue={row.forms} placeholder="Enter a value" />
              <span className="soi-actions">
                <CloneIcon onClick={() => cloneRow(i)} />
                <CloseIcon onClick={() => removeSoiRow(i)} />
              </span>
            </div>
          ))}
        </div>

        </div>
        {/* end edit-modal-body */}

        {/* Footer */}
        <div className="edit-modal-footer">
          <button className="btn-cancel" onClick={onClose}>CANCEL</button>
          <button className="btn-add-submit" onClick={handleAdd} disabled={!canSave} style={{ opacity: canSave ? 1 : 0.5 }}>ADD</button>
        </div>
      </div>
    </div>
  );
}
