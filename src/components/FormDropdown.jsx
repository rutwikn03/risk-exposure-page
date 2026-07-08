import React, { useState, useRef, useEffect } from 'react';

const formDropdownOptions = {
  constructionType: {
    placeholder: 'Select Construction Type',
    options: ['Frame', 'Joisted Masonry', 'Non Combustible', 'Masonry Non Combustible', 'Modified Fire Resistive', 'Fire Resistive'],
  },
};

export default function FormDropdown({ type, value, onChange }) {
  const [open, setOpen] = useState(false);
  const [selected, setSelected] = useState(value || '');
  const ref = useRef(null);

  const config = formDropdownOptions[type];

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
    if (onChange) onChange(option);
    setOpen(false);
  };

  return (
    <div className="form-dropdown" ref={ref}>
      <button className={`form-dropdown-trigger${open ? ' open' : ''}`} onClick={() => setOpen(!open)} type="button">
        <span className={selected ? 'form-dropdown-value' : 'form-dropdown-placeholder'}>
          {selected || 'Enter a value'}
        </span>
        <span className="form-dropdown-arrow">▾</span>
      </button>
      {open && (
        <div className="form-dropdown-menu">
          <div className="form-dropdown-hint">{config.placeholder}</div>
          {config.options.map((option) => (
            <div
              key={option}
              className={`form-dropdown-option${option === selected ? ' active' : ''}`}
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
