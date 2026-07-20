import React, { useState } from 'react';

export default function EditDriverModal({ onClose, drivers, onSave }) {
  const [editData, setEditData] = useState(drivers.map(d => ({ ...d })));
  const [confirmDelete, setConfirmDelete] = useState(null);

  const updateField = (id, field, value) => {
    setEditData(prev => prev.map(d => d.id === id ? { ...d, [field]: value } : d));
  };

  const deleteRow = (id) => {
    setEditData(prev => prev.filter(d => d.id !== id));
    setConfirmDelete(null);
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
          <div className="ca-edit-grid-wrapper">
            <table className="ca-edit-grid">
              <thead>
                <tr>
                  <th>Full Name</th>
                  <th>Sex</th>
                  <th>License #</th>
                  <th>State</th>
                  <th>Exp (yrs)</th>
                  <th>Date Hired</th>
                  <th>Address</th>
                  <th>Yr LIC</th>
                  <th className="ca-edit-grid-actions-th"></th>
                </tr>
              </thead>
              <tbody>
                {editData.map(d => (
                  <tr key={d.id}>
                    <td>
                      <input type="text" className="ca-edit-grid-input" value={d.fullName} onChange={e => updateField(d.id, 'fullName', e.target.value)} />
                    </td>
                    <td>
                      <select className="ca-edit-grid-select" value={d.sex} onChange={e => updateField(d.id, 'sex', e.target.value)}>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                      </select>
                    </td>
                    <td>
                      <input type="text" className="ca-edit-grid-input" value={d.licNum} onChange={e => updateField(d.id, 'licNum', e.target.value)} />
                    </td>
                    <td>
                      <input type="text" className="ca-edit-grid-input ca-edit-grid-input--sm" value={d.stateLic} onChange={e => updateField(d.id, 'stateLic', e.target.value)} />
                    </td>
                    <td>
                      <input type="text" className="ca-edit-grid-input ca-edit-grid-input--sm" value={d.yrsExp} onChange={e => updateField(d.id, 'yrsExp', e.target.value)} />
                    </td>
                    <td>
                      <input type="text" className="ca-edit-grid-input" value={d.dateHired} onChange={e => updateField(d.id, 'dateHired', e.target.value)} />
                    </td>
                    <td>
                      <input type="text" className="ca-edit-grid-input" value={d.address} onChange={e => updateField(d.id, 'address', e.target.value)} />
                    </td>
                    <td>
                      <input type="text" className="ca-edit-grid-input ca-edit-grid-input--sm" value={d.licYear || ''} onChange={e => updateField(d.id, 'licYear', e.target.value)} placeholder="e.g. 2028" />
                    </td>
                    <td className="ca-edit-grid-actions">
                      <img src="/delete.svg" alt="Delete" className="ca-edit-grid-delete" onClick={() => setConfirmDelete({ id: d.id, name: d.fullName })} title="Remove" />
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
        <div className="edit-modal-footer">
          <button className="btn-cancel" onClick={onClose}>CANCEL</button>
          <button className="btn-add-submit" onClick={handleSave}>SAVE</button>
        </div>
        {confirmDelete && (
          <div className="modal-overlay" style={{ position: 'absolute', inset: 0, borderRadius: 'inherit' }} onClick={() => setConfirmDelete(null)}>
            <div className="ca-delete-confirm" onClick={e => e.stopPropagation()}>
              <h3 className="ca-delete-confirm-title">Delete Driver</h3>
              <p className="ca-delete-confirm-msg">Are you sure you want to delete <strong>{confirmDelete.name}</strong>? This action cannot be undone.</p>
              <div className="ca-delete-confirm-btns">
                <button className="btn-cancel" onClick={() => setConfirmDelete(null)}>CANCEL</button>
                <button className="ca-delete-confirm-btn" onClick={() => deleteRow(confirmDelete.id)}>DELETE</button>
              </div>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}
