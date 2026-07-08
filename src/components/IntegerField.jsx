import React, { useState } from 'react';

export default function IntegerField({ label, value, onChange, placeholder = 'Enter a value' }) {
  const [error, setError] = useState(false);

  const handleChange = (e) => {
    const val = e.target.value;
    if (val === '' || /^\d+$/.test(val)) {
      setError(false);
      onChange(val);
    } else {
      setError(true);
      onChange(val);
    }
  };

  return (
    <div className="edit-modal-field">
      <label>{label}</label>
      <input
        type="text"
        value={value}
        onChange={handleChange}
        placeholder={placeholder}
        className={error ? 'field-error' : ''}
      />
      {error && <span className="field-error-msg">Only integers allowed</span>}
    </div>
  );
}
