import React, { useState } from 'react';

const ALL_COVERAGES = [
  "Liability-BI", "Liability-PD", "Collision", "Comprehensive",
  "Cargo", "Uninsured", "Underinsured", "Medical Payments",
  "Personal Injury", "Rental Reimbursement", "Towing", "Gap Coverage"
];

export default function EditVehicleModal({ onClose, vehicles, onSave }) {
  const [editData, setEditData] = useState(
    vehicles.map(v => ({ ...v, coverages: v.coverages || [] }))
  );
  const [expandedId, setExpandedId] = useState(null);

  const toggleExpand = (id) => {
    setExpandedId(expandedId === id ? null : id);
  };

  const updateVehicle = (id, field, value) => {
    setEditData(prev => prev.map(v => v.id === id ? { ...v, [field]: value } : v));
  };

  const toggleCoverage = (id, cov) => {
    setEditData(prev => prev.map(v => {
      if (v.id !== id) return v;
      const covs = v.coverages || [];
      return { ...v, coverages: covs.includes(cov) ? covs.filter(c => c !== cov) : [...covs, cov] };
    }));
  };

  const removeCoverage = (id, cov) => {
    setEditData(prev => prev.map(v => {
      if (v.id !== id) return v;
      return { ...v, coverages: (v.coverages || []).filter(c => c !== cov) };
    }));
  };

  const handleSave = () => {
    onSave(editData);
    onClose();
  };

  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className="edit-modal" onClick={e => e.stopPropagation()}>
        <div className="edit-modal-header">
          <h1 className="modal-main-heading">Edit Vehicle Details</h1>
        </div>
        <div className="edit-modal-body">
          <div className="ca-edit-list">
            {editData.map((v) => (
              <div className="ca-edit-item" key={v.id}>
                <div className="ca-edit-item-header" onClick={() => toggleExpand(v.id)}>
                  <span className="ca-edit-item-title">{v.yearMakeModel}</span>
                  <span className="ca-edit-item-badge">{v.bodyType}</span>
                  <span className="ca-edit-item-vin">VIN: {v.vin}</span>
                  <span className={`ca-edit-chevron ${expandedId === v.id ? 'open' : ''}`}>▾</span>
                </div>
                {expandedId === v.id && (
                  <div className="ca-edit-item-body">
                    <div className="edit-modal-card">
                      <div className="edit-modal-row">
                        <div className="edit-modal-field" style={{ flex: 1 }}>
                          <label>Year, Make, Model <span className="req">*</span></label>
                          <input type="text" value={v.yearMakeModel} onChange={e => updateVehicle(v.id, 'yearMakeModel', e.target.value)} />
                        </div>
                        <div className="edit-modal-field" style={{ width: 160 }}>
                          <label>Body Type <span className="req">*</span></label>
                          <select value={v.bodyType} onChange={e => updateVehicle(v.id, 'bodyType', e.target.value)} className="modal-select">
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
                          <input type="text" value={v.vin} onChange={e => updateVehicle(v.id, 'vin', e.target.value)} />
                        </div>
                        <div className="edit-modal-field" style={{ width: 160 }}>
                          <label>Cost New</label>
                          <input type="text" value={v.costNew} onChange={e => updateVehicle(v.id, 'costNew', e.target.value)} />
                        </div>
                        <div className="edit-modal-field" style={{ width: 100 }}>
                          <label>State LIC</label>
                          <input type="text" value={v.stateLic} onChange={e => updateVehicle(v.id, 'stateLic', e.target.value)} />
                        </div>
                      </div>
                      <div className="edit-modal-row">
                        <div className="edit-modal-field" style={{ flex: 1 }}>
                          <label>Garaging Address</label>
                          <input type="text" value={v.address} onChange={e => updateVehicle(v.id, 'address', e.target.value)} />
                        </div>
                      </div>
                    </div>
                    {/* Coverages */}
                    <div className="edit-modal-card" style={{ marginTop: 12 }}>
                      <label style={{ fontSize: 13, fontWeight: 600, marginBottom: 6, display: 'block' }}>Coverages</label>
                      <div className="cov-selected-box">
                        {(!v.coverages || v.coverages.length === 0) && <span className="cov-placeholder">No coverages selected</span>}
                        {(v.coverages || []).map(cov => (
                          <span className="cov-tag cov-tag--selected" key={cov}>
                            {cov}
                            <span className="cov-tag-remove" onClick={() => removeCoverage(v.id, cov)}>✕</span>
                          </span>
                        ))}
                      </div>
                      <div className="cov-available">
                        {ALL_COVERAGES.map(cov => (
                          <span
                            key={cov}
                            className={`cov-tag ${(v.coverages || []).includes(cov) ? 'cov-tag--active' : ''}`}
                            onClick={() => toggleCoverage(v.id, cov)}
                          >
                            {cov}
                          </span>
                        ))}
                      </div>
                    </div>
                  </div>
                )}
              </div>
            ))}
          </div>
        </div>

        <div className="edit-modal-footer">
          <button className="btn-cancel" onClick={onClose}>CANCEL</button>
          <button className="btn-add-submit" onClick={handleSave}>SAVE</button>
        </div>
      </div>
    </div>
  );
}
