import React, { useState } from 'react';

const ALL_COVERAGES = [
  "Liability-BI", "Liability-PD", "Collision", "Comprehensive",
  "Cargo", "Uninsured", "Underinsured", "Medical Payments",
  "Personal Injury", "Rental Reimbursement", "Towing", "Gap Coverage"
];

export default function AddVehicleModal({ onClose, onAdd }) {
  const [fields, setFields] = useState({
    yearMakeModel: '', bodyType: '', vin: '',
    street: '', city: '', state: '', zip: '', stateLic: '',
    costNew: '',
  });
  const [coverages, setCoverages] = useState([]);

  const update = (k, v) => setFields(prev => ({ ...prev, [k]: v }));

  const handleCostChange = (val) => {
    const numeric = val.replace(/[^0-9.]/g, '');
    update('costNew', numeric);
  };

  const formatCost = () => {
    if (fields.costNew) {
      const num = parseFloat(fields.costNew);
      if (!isNaN(num)) {
        update('costNew', num.toLocaleString('en-US'));
      }
    }
  };

  const toggleCoverage = (cov) => {
    setCoverages(prev =>
      prev.includes(cov) ? prev.filter(c => c !== cov) : [...prev, cov]
    );
  };

  const removeCoverage = (cov) => {
    setCoverages(prev => prev.filter(c => c !== cov));
  };

  const canSave = fields.yearMakeModel && fields.bodyType && fields.vin && fields.state;

  const handleSubmit = () => {
    if (!canSave) return;
    const address = [fields.street, fields.city, fields.state, fields.zip].filter(Boolean).join(', ');
    onAdd({
      id: Date.now(),
      yearMakeModel: fields.yearMakeModel,
      bodyType: fields.bodyType,
      vin: fields.vin,
      address,
      stateLic: fields.stateLic || fields.state,
      costNew: fields.costNew ? '$' + fields.costNew : '-',
      coverages,
    });
  };

  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className="edit-modal" onClick={e => e.stopPropagation()}>
        <div className="edit-modal-header">
          <h1 className="modal-main-heading">Add Vehicle</h1>
        </div>
        <div className="edit-modal-body">
          {/* Vehicle Details */}
          <h2 className="edit-modal-title">Vehicle Details</h2>
          <div className="edit-modal-card">
            <div className="edit-modal-row">
              <div className="edit-modal-field" style={{ flex: 1 }}>
                <label>Year, Make, Model <span className="req">*</span></label>
                <input type="text" placeholder="e.g. 2024 Ford Transit 250" value={fields.yearMakeModel} onChange={e => update('yearMakeModel', e.target.value)} />
              </div>
              <div className="edit-modal-field" style={{ width: 180 }}>
                <label>Body Type <span className="req">*</span></label>
                <select value={fields.bodyType} onChange={e => update('bodyType', e.target.value)} className="modal-select">
                  <option value="">Select...</option>
                  <option value="Van">Van</option>
                  <option value="Truck">Truck</option>
                  <option value="Sedan">Sedan</option>
                  <option value="SUV">SUV</option>
                  <option value="Semi">Semi</option>
                  <option value="Box Truck">Box Truck</option>
                </select>
              </div>
            </div>
            <div className="edit-modal-row">
              <div className="edit-modal-field" style={{ flex: 1 }}>
                <label>V.I.N <span className="req">*</span></label>
                <input type="text" placeholder="Enter VIN" value={fields.vin} onChange={e => update('vin', e.target.value)} />
              </div>
              <div className="edit-modal-field" style={{ width: 180 }}>
                <label>Cost New</label>
                <div className="cost-input-wrapper">
                  <span className="cost-prefix">$</span>
                  <input type="text" placeholder="0.00" value={fields.costNew} onChange={e => handleCostChange(e.target.value)} onBlur={formatCost} className="cost-input" />
                </div>
              </div>
            </div>
          </div>

          {/* Garaging Address */}
          <h2 className="edit-modal-title" style={{ marginTop: 16 }}>Garaging Address</h2>
          <div className="edit-modal-card">
            <div className="edit-modal-row">
              <div className="edit-modal-field" style={{ flex: 1 }}>
                <label>Street Address <span className="req">*</span></label>
                <input type="text" placeholder="Enter street address" value={fields.street} onChange={e => update('street', e.target.value)} />
              </div>
              <div className="edit-modal-field" style={{ width: 140 }}>
                <label>State LIC <span className="req">*</span></label>
                <select value={fields.state} onChange={e => { update('state', e.target.value); update('stateLic', e.target.value); }} className="modal-select">
                  <option value="">Select...</option>
                  <option value="TX">TX</option><option value="CA">CA</option>
                  <option value="IL">IL</option><option value="FL">FL</option>
                  <option value="NY">NY</option><option value="GA">GA</option>
                  <option value="CO">CO</option><option value="TN">TN</option>
                  <option value="PA">PA</option><option value="AZ">AZ</option>
                </select>
              </div>
            </div>
            <div className="edit-modal-row">
              <div className="edit-modal-field" style={{ flex: 1 }}>
                <label>City</label>
                <input type="text" placeholder="Enter city" value={fields.city} onChange={e => update('city', e.target.value)} />
              </div>
              <div className="edit-modal-field" style={{ width: 180 }}>
                <label>Zip Code</label>
                <input type="text" placeholder="Enter zip" value={fields.zip} onChange={e => update('zip', e.target.value)} />
              </div>
            </div>
          </div>

          {/* Coverages */}
          <h2 className="edit-modal-title" style={{ marginTop: 16 }}>Coverages</h2>
          <div className="edit-modal-card">
            {/* Selected coverages box */}
            <div className="cov-selected-box">
              {coverages.length === 0 && <span className="cov-placeholder">Click coverages below to add them</span>}
              {coverages.map(cov => (
                <span className="cov-tag cov-tag--selected" key={cov}>
                  {cov}
                  <span className="cov-tag-remove" onClick={() => removeCoverage(cov)}>✕</span>
                </span>
              ))}
            </div>
            {/* Available coverages */}
            <div className="cov-available">
              {ALL_COVERAGES.map(cov => (
                <span
                  key={cov}
                  className={`cov-tag ${coverages.includes(cov) ? 'cov-tag--active' : ''}`}
                  onClick={() => toggleCoverage(cov)}
                >
                  {cov}
                </span>
              ))}
            </div>
          </div>
        </div>

        <div className="edit-modal-footer">
          <button className="btn-cancel" onClick={onClose}>CANCEL</button>
          <button className="btn-add-submit" onClick={handleSubmit} disabled={!canSave} style={{ opacity: canSave ? 1 : 0.5 }}>ADD</button>
        </div>
      </div>
    </div>
  );
}
