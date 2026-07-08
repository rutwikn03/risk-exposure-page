import React, { useState, useRef, useEffect } from 'react';

const dropdownOptions = {
  subject: {
    placeholder: 'Select Subject of Insurance',
    options: ['Building', 'Business Personal Property', 'Business Income with Extra Expense', 'Extra Expense', 'Furniture & Fixtures', 'Machinery Equipment', 'Personal Property'],
  },
  valuation: {
    placeholder: 'Select Valuation',
    options: ['Actual Cash Value', 'Replacement Cost', 'Agreed Amount', 'Market Value'],
  },
  cause: {
    placeholder: 'Select Causes of Loss',
    options: ['Basic', 'Broad', 'Earthquake', 'Special Excluding Theft'],
  },
};

export default function SoiDropdown({ type, value, onChange }) {
  const [open, setOpen] = useState(false);
  const [selected, setSelected] = useState(value || '');
  const ref = useRef(null);

  const config = dropdownOptions[type];

  useEffect(() => {
    setSelected(value || '');
  }, [value]);

  useEffect(() => {
    function handleClickOutside(e) {
      if (ref.current && !ref.current.contains(e.target)) {
        setOpen(false);
      }
    }
    document.addEventListener('mousedown', handleClickOutside);
    return () => document.removeEventListener('mousedown', handleClickOutside);
  }, []);

  const handleSelect = (option) => {
    setSelected(option);
    onChange(option);
    setOpen(false);
  };

  return (
    <div className="soi-dropdown" ref={ref}>
      <button className={`soi-dropdown-trigger${open ? ' open' : ''}`} onClick={() => setOpen(!open)} type="button">
        <span className={selected ? 'soi-dropdown-value' : 'soi-dropdown-placeholder'}>
          {selected || 'Enter Value'}
        </span>
        <span className="soi-dropdown-arrow">▾</span>
      </button>
      {open && (
        <div className="soi-dropdown-menu">
          <div className="soi-dropdown-hint">{config.placeholder}</div>
          {config.options.map((option) => (
            <div
              key={option}
              className={`soi-dropdown-option${option === selected ? ' active' : ''}`}
              onClick={() => handleSelect(option)}
            >
              {option}
            </div>
          ))}
        </div>
      )}
    </div>
  );
}
