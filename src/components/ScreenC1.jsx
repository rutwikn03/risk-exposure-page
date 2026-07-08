import React, { useState } from 'react';

// Get unique values for filters from locations data
function getUniqueValues(locations) {
  const uniqueYears = [...new Set(locations.map(l => l.yearBuilt))].sort();
  const uniqueCities = [...new Set(locations.map(l => l.city))].sort();
  const uniqueStates = [...new Set(locations.map(l => l.state))].sort();
  const uniqueCountries = [...new Set(locations.map(l => l.country))].sort();
  return { uniqueYears, uniqueCities, uniqueStates, uniqueCountries };
}

export default function ScreenC1({ onSelectLocation, locations, recentsList, timestamps }) {
  const [filters, setFilters] = useState({ yearBuilt: '', city: '', state: '', country: '' });

  const formatTimestamp = (ts) => {
    if (!ts) return '-';
    const d = new Date(ts);
    const day = String(d.getDate()).padStart(2, '0');
    const months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
    const month = months[d.getMonth()];
    const year = d.getFullYear();
    let hours = d.getHours();
    const mins = String(d.getMinutes()).padStart(2, '0');
    const ampm = hours >= 12 ? 'PM' : 'AM';
    hours = hours % 12 || 12;
    return `${day} ${month} ${year}, ${String(hours).padStart(2, '0')}:${mins} ${ampm}`;
  };

  // Order table by recents list
  const orderedData = recentsList.map(name => {
    const loc = locations.find(l => l.name === name);
    if (!loc) return null;
    return {
      premise: `${loc.location} | ${loc.building}`,
      name: loc.name,
      address: `${loc.city}, ${loc.country}`,
      zip: loc.zip,
      yearBuilt: loc.yearBuilt,
      city: loc.city,
      state: loc.state,
      country: loc.country,
      lastAccessed: formatTimestamp(timestamps[name]),
    };
  }).filter(Boolean);
  const { uniqueYears, uniqueCities, uniqueStates, uniqueCountries } = getUniqueValues(locations);

  const filteredData = orderedData.filter((row) => {
    if (filters.yearBuilt && row.yearBuilt !== filters.yearBuilt) return false;
    if (filters.city && row.city !== filters.city) return false;
    if (filters.state && row.state !== filters.state) return false;
    if (filters.country && row.country !== filters.country) return false;
    return true;
  });

  return (
    <div className="right-content">
      <div className="right-content-header">
        <h3>Recent</h3>
        <div className="filter-bar">
          <div className="filter-search">
            <svg width="14" height="14" viewBox="0 0 14 14" fill="none">
              <circle cx="5.5" cy="5.5" r="4" stroke="#6b6b6b" strokeWidth="1.3" />
              <line x1="8.5" y1="8.5" x2="12.5" y2="12.5" stroke="#6b6b6b" strokeWidth="1.3" />
            </svg>
            <input type="text" placeholder="Search" />
          </div>
          <FilterDropdown label="YR. BUILT" value={filters.yearBuilt} options={uniqueYears} onChange={(v) => setFilters({...filters, yearBuilt: v})} />
          <FilterDropdown label="CITY" value={filters.city} options={uniqueCities} onChange={(v) => setFilters({...filters, city: v})} />
          <FilterDropdown label="STATE" value={filters.state} options={uniqueStates} onChange={(v) => setFilters({...filters, state: v})} />
          <FilterDropdown label="COUNTRY" value={filters.country} options={uniqueCountries} onChange={(v) => setFilters({...filters, country: v})} />
        </div>
      </div>
      <div className="data-table-wrapper">
        <table className="data-table">
          <thead>
            <tr>
              <th>Premise</th>
              <th>Address</th>
              <th>Zip code</th>
              <th>Last Accessed</th>
            </tr>
          </thead>
          <tbody>
            {filteredData.map((row, i) => (
              <tr key={i}>
                <td
                  className="premise-link"
                  onClick={() => onSelectLocation(row.name)}
                >
                  {row.premise}
                </td>
                <td>{row.address}</td>
                <td>{row.zip}</td>
                <td className="last-edited">{row.lastAccessed}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}

function FilterDropdown({ label, value, options, onChange }) {
  const [open, setOpen] = useState(false);
  const ref = React.useRef(null);

  React.useEffect(() => {
    function handleClickOutside(e) {
      if (ref.current && !ref.current.contains(e.target)) {
        setOpen(false);
      }
    }
    document.addEventListener('mousedown', handleClickOutside);
    return () => document.removeEventListener('mousedown', handleClickOutside);
  }, []);

  return (
    <div className="filter-dropdown" ref={ref} onClick={() => setOpen(!open)} style={{ position: 'relative' }}>
      <span className="filter-label">{label}</span>
      <span className="filter-separator"></span>
      <span className="filter-value">{value || 'Any'}</span>
      <span className="dropdown-arrow"></span>
      {open && (
        <div className="filter-dropdown-menu">
          <div className="filter-dropdown-option" onClick={(e) => { e.stopPropagation(); onChange(''); setOpen(false); }}>
            <em>Any</em>
          </div>
          {options.map((opt) => (
            <div
              key={opt}
              className={`filter-dropdown-option${opt === value ? ' active' : ''}`}
              onClick={(e) => { e.stopPropagation(); onChange(opt); setOpen(false); }}
            >
              {opt}
            </div>
          ))}
        </div>
      )}
    </div>
  );
}
