import React, { useState } from 'react';

export default function EditVehicleModal({ onClose, vehicles, onSave }) {
  const [editData, setEditData] = useState(vehicles.map(v => ({ ...v })));
  const [confirmDelete, setConfirmDelete] = useState(null);

  const updateField = (id, field, value) => {
    setEditData(prev => prev.map(v => v.id === id ? { ...v, [field]: value } : v));
  };

  const deleteRow = (id) => {
    setEditData(prev => prev.filter(v => v.id !== id));
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
          <h1 className="modal-main-heading">Edit Vehicle Details</h1>
        </div>
        <div className="edit-modal-body">
          <div className="ca-edit-grid-wrapper">
            <table className="ca-edit-grid">
              <thead>
                <tr>
                  <th>Year, Make, Model</th>
                  <th>Body Type</th>
                  <th>V.I.N</th>
                  <th>Address</th>
                  <th>State</th>
                  <th>Cost New</th>
                  <th className="ca-edit-grid-actions-th"></th>
                </tr>
              </thead>
              <tbody>
                {editData.map(v => (
                  <tr key={v.id}>
                    <td>
                      <input type="text" className="ca-edit-grid-input" value={v.yearMakeModel} onChange={e => updateField(v.id, 'yearMakeModel', e.target.value)} />
                    </td>
                    <td>
                      <select className="ca-edit-grid-select" value={v.bodyType} onChange={e => updateField(v.id, 'bodyType', e.target.value)}>
                        <option value="Van">Van</option>
                        <option value="Truck">Truck</option>
                        <option value="Sedan">Sedan</option>
                        <option value="SUV">SUV</option>
                        <option value="Semi">Semi</option>
                        <option value="Box Truck">Box Truck</option>
                      </select>
                    </td>
                    <td>
                      <input type="text" className="ca-edit-grid-input" value={v.vin} onChange={e => updateField(v.id, 'vin', e.target.value)} />
                    </td>
                    <td>
                      <input type="text" className="ca-edit-grid-input" value={v.address} onChange={e => updateField(v.id, 'address', e.target.value)} />
                    </td>
                    <td>
                      <input type="text" className="ca-edit-grid-input ca-edit-grid-input--sm" value={v.stateLic} onChange={e => updateField(v.id, 'stateLic', e.target.value)} />
                    </td>
                    <td>
                      <input type="text" className="ca-edit-grid-input ca-edit-grid-input--sm" value={v.costNew} onChange={e => updateField(v.id, 'costNew', e.target.value)} />
                    </td>
                    <td className="ca-edit-grid-actions">
                      <img src="/delete.svg" alt="Delete" className="ca-edit-grid-delete" onClick={() => setConfirmDelete({ id: v.id, name: v.yearMakeModel })} title="Remove" />
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
              <h3 className="ca-delete-confirm-title">Delete Vehicle</h3>
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
