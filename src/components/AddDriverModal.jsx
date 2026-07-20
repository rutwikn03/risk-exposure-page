import React, { useState } from 'react';

export default function AddDriverModal({ onClose, onAdd }) {
  const [fields, setFields] = useState({
    fullName: '', sex: '', licNum: '', stateLic: '',
    yrsExp: '', dateHired: '', licYear: '', street: '', city: '', state: '', zip: '',
  });

  const update = (k, v) => setFields(prev => ({ ...prev, [k]: v }));

  const canSave = fields.fullName && fields.licNum && fields.stateLic;

  const handleSubmit = () => {
    if (!canSave) return;
    const address = [fields.street, fields.city, fields.state, fields.zip].filter(Boolean).join(', ');
    onAdd({
      id: Date.now(),
      fullName: fields.fullName,
      sex: fields.sex || 'Male',
      licNum: fields.licNum,
      stateLic: fields.stateLic,
      licYear: fields.licYear || '',
      yrsExp: fields.yrsExp || '0',
      dateHired: fields.dateHired || '-',
      address,
    });
  };

  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className="edit-modal" onClick={e => e.stopPropagation()}>
        <div className="edit-modal-header">
          <h1 className="modal-main-heading">Add Driver</h1>
        </div>
        <div className="edit-modal-body">
          {/* Driver Details */}
          <h2 className="edit-modal-title">Driver Details</h2>
          <div className="edit-modal-card">
            <div className="edit-modal-row">
              <div className="edit-modal-field" style={{ flex: 1 }}>
                <label>Full Name <span className="req">*</span></label>
                <input type="text" placeholder="e.g. Marcus D. Johnson" value={fields.fullName} onChange={e => update('fullName', e.target.value)} />
              </div>
              <div className="edit-modal-field" style={{ width: 140 }}>
                <label>Sex</label>
                <select value={fields.sex} onChange={e => update('sex', e.target.value)} className="modal-select">
                  <option value="">Select...</option>
                  <option value="Male">Male</option>
                  <option value="Female">Female</option>
                </select>
              </div>
            </div>
            <div className="edit-modal-row">
              <div className="edit-modal-field" style={{ flex: 1 }}>
                <label>License Number <span className="req">*</span></label>
                <input type="text" placeholder="Enter license number" value={fields.licNum} onChange={e => update('licNum', e.target.value)} />
              </div>
              <div className="edit-modal-field" style={{ width: 140 }}>
                <label>State LIC <span className="req">*</span></label>
                <select value={fields.stateLic} onChange={e => update('stateLic', e.target.value)} className="modal-select">
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
              <div className="edit-modal-field" style={{ width: 160 }}>
                <label>Years Experience</label>
                <input type="text" placeholder="e.g. 5" value={fields.yrsExp} onChange={e => update('yrsExp', e.target.value)} />
              </div>
              <div className="edit-modal-field" style={{ width: 180 }}>
                <label>Date Hired</label>
                <input type="text" placeholder="e.g. Mar 2019" value={fields.dateHired} onChange={e => update('dateHired', e.target.value)} />
              </div>
              <div className="edit-modal-field" style={{ width: 140 }}>
                <label>Yr LIC (expiry)</label>
                <input type="text" placeholder="e.g. 2028" value={fields.licYear} onChange={e => update('licYear', e.target.value)} />
              </div>
            </div>
          </div>

          {/* Address - below driver details */}
          <h2 className="edit-modal-title" style={{ marginTop: 16 }}>Address</h2>
          <div className="edit-modal-card">
            <div className="edit-modal-row">
              <div className="edit-modal-field" style={{ flex: 1 }}>
                <label>Street</label>
                <input type="text" placeholder="Enter street address" value={fields.street} onChange={e => update('street', e.target.value)} />
              </div>
              <div className="edit-modal-field" style={{ width: 140 }}>
                <label>State</label>
                <select value={fields.state} onChange={e => update('state', e.target.value)} className="modal-select">
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
        </div>

        <div className="edit-modal-footer">
          <button className="btn-cancel" onClick={onClose}>CANCEL</button>
          <button className="btn-add-submit" onClick={handleSubmit} disabled={!canSave} style={{ opacity: canSave ? 1 : 0.5 }}>ADD</button>
        </div>
      </div>
    </div>
  );
}
