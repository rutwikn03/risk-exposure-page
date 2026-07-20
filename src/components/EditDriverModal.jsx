import React, { useState } from 'react';

export default function EditDriverModal({ onClose, drivers, onSave }) {
  const [editData, setEditData] = useState(
    drivers.map(d => ({ ...d }))
  );
  const [expandedId, setExpandedId] = useState(null);

  const toggleExpand = (id) => {
    setExpandedId(expandedId === id ? null : id);
  };

  const updateDriver = (id, field, value) => {
    setEditData(prev => prev.map(d => d.id === id ? { ...d, [field]: value } : d));
  };

  const handleSave = () => {
    onSave(editData);
    onClose();
  };

  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className="edit-modal" onClick={e => e.stopPropagation()}>
        <div className="edit-modal-header">
          <h1 className="modal-main-heading">Edit Driver Details</h1>
        </div>
        <div className="edit-modal-body">
          <div className="ca-edit-list">
            {editData.map((d) => (
              <div className="ca-edit-item" key={d.id}>
                <div className="ca-edit-item-header" onClick={() => toggleExpand(d.id)}>
                  <span className="ca-edit-item-title">{d.fullName}</span>
                  <span className="ca-edit-item-badge">{d.sex}</span>
                  <span className="ca-edit-item-vin">LIC: {d.licNum}</span>
                  <span className={`ca-edit-chevron ${expandedId === d.id ? 'open' : ''}`}>▾</span>
                </div>
                {expandedId === d.id && (
                  <div className="ca-edit-item-body">
                    <div className="edit-modal-card">
                      <div className="edit-modal-row">
                        <div className="edit-modal-field" style={{ flex: 1 }}>
                          <label>Full Name <span className="req">*</span></label>
                          <input type="text" value={d.fullName} onChange={e => updateDriver(d.id, 'fullName', e.target.value)} />
                        </div>
                        <div className="edit-modal-field" style={{ width: 120 }}>
                          <label>Sex</label>
                          <select value={d.sex} onChange={e => updateDriver(d.id, 'sex', e.target.value)} className="modal-select">
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                          </select>
                        </div>
                      </div>
                      <div className="edit-modal-row">
                        <div className="edit-modal-field" style={{ flex: 1 }}>
                          <label>License Number <span className="req">*</span></label>
                          <input type="text" value={d.licNum} onChange={e => updateDriver(d.id, 'licNum', e.target.value)} />
                        </div>
                        <div className="edit-modal-field" style={{ width: 100 }}>
                          <label>State LIC</label>
                          <input type="text" value={d.stateLic} onChange={e => updateDriver(d.id, 'stateLic', e.target.value)} />
                        </div>
                        <div className="edit-modal-field" style={{ width: 120 }}>
                          <label>Experience (yrs)</label>
                          <input type="text" value={d.yrsExp} onChange={e => updateDriver(d.id, 'yrsExp', e.target.value)} />
                        </div>
                      </div>
                      <div className="edit-modal-row">
                        <div className="edit-modal-field" style={{ width: 160 }}>
                          <label>Date Hired</label>
                          <input type="text" value={d.dateHired} onChange={e => updateDriver(d.id, 'dateHired', e.target.value)} />
                        </div>
                        <div className="edit-modal-field" style={{ flex: 1 }}>
                          <label>Address</label>
                          <input type="text" value={d.address} onChange={e => updateDriver(d.id, 'address', e.target.value)} />
                        </div>
                      </div>
                      <div className="edit-modal-row">
                        <div className="edit-modal-field" style={{ width: 160 }}>
                          <label>Renewal Status</label>
                          <select value={d.renewalColor} onChange={e => {
                            const color = e.target.value;
                            let text = d.renewalText;
                            if (color === '#991B1B') text = 'Expired';
                            updateDriver(d.id, 'renewalColor', color);
                            updateDriver(d.id, 'renewalText', text);
                          }} className="modal-select">
                            <option value="#117C00">Active (Green)</option>
                            <option value="#92400E">Warning (Amber)</option>
                            <option value="#991B1B">Expired (Red)</option>
                          </select>
                        </div>
                        <div className="edit-modal-field" style={{ width: 160 }}>
                          <label>Renewal Text</label>
                          <input type="text" value={d.renewalText} onChange={e => updateDriver(d.id, 'renewalText', e.target.value)} />
                        </div>
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
