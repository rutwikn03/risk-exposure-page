import React from 'react';

function EditIcon() {
  return (
    <img className="edit-icon" src="/edit.svg" alt="Edit" width="14" height="14" />
  );
}

export default function LeftSidebar({ selectedLocation, onSelectLocation, onAddPremise, onEditPremise, locations }) {
  const [searchQuery, setSearchQuery] = React.useState('');
  const [filterYear, setFilterYear] = React.useState('');
  const [filterState, setFilterState] = React.useState('');
  const [openFilter, setOpenFilter] = React.useState(null);
  const filterRef = React.useRef(null);

  React.useEffect(() => {
    function handleClick(e) {
      if (filterRef.current && !filterRef.current.contains(e.target)) setOpenFilter(null);
    }
    document.addEventListener('mousedown', handleClick);
    return () => document.removeEventListener('mousedown', handleClick);
  }, []);

  const uniqueYears = [...new Set(locations.map(l => l.yearBuilt))].sort();
  const uniqueStates = [...new Set(locations.map(l => l.state))].sort();

  const filteredLocations = locations.filter(loc => {
    if (filterYear && loc.yearBuilt !== filterYear) return false;
    if (filterState && loc.state !== filterState) return false;
    if (!searchQuery) return true;
    const searchLower = searchQuery.toLowerCase();
    return loc.name.toLowerCase().includes(searchLower) ||
      loc.location.toLowerCase().includes(searchLower) ||
      loc.building.toLowerCase().includes(searchLower) ||
      loc.street.toLowerCase().includes(searchLower) ||
      loc.city.toLowerCase().includes(searchLower) ||
      loc.state.toLowerCase().includes(searchLower) ||
      loc.country.toLowerCase().includes(searchLower) ||
      loc.zip.toLowerCase().includes(searchLower);
  });

  return (
    <div className="left-sidebar">
      <div className="left-sidebar-header">
        <div className="search-box">
          <svg width="12" height="12" viewBox="0 0 12 12" fill="none">
            <circle cx="5" cy="5" r="4" stroke="#767676" strokeWidth="1.2" />
            <line x1="8" y1="8" x2="11" y2="11" stroke="#767676" strokeWidth="1.2" />
          </svg>
          <input type="text" placeholder="Search" value={searchQuery} onChange={(e) => setSearchQuery(e.target.value)} />
          {searchQuery && (
            <span style={{ cursor: 'pointer', color: '#999', fontSize: 14 }} onClick={() => setSearchQuery('')}>✕</span>
          )}
        </div>
        <img src="/add premise.svg" alt="Add Premise" className="add-premise-btn-img" onClick={onAddPremise} />
      </div>
      <div className="left-sidebar-filters" ref={filterRef}>
        <div className="sidebar-filter" onClick={() => setOpenFilter(openFilter === 'year' ? null : 'year')}>
          <span className="sidebar-filter-label">YR. BUILT</span>
          <span className="sidebar-filter-value">{filterYear || 'Any'}</span>
          <span className="sidebar-filter-arrow">▾</span>
          {openFilter === 'year' && (
            <div className="sidebar-filter-menu">
              <div className="sidebar-filter-option" onClick={(e) => { e.stopPropagation(); setFilterYear(''); setOpenFilter(null); }}><em>Any</em></div>
              {uniqueYears.map(y => (
                <div key={y} className={`sidebar-filter-option${y === filterYear ? ' active' : ''}`} onClick={(e) => { e.stopPropagation(); setFilterYear(y); setOpenFilter(null); }}>{y}</div>
              ))}
            </div>
          )}
        </div>
        <div className="sidebar-filter" onClick={() => setOpenFilter(openFilter === 'state' ? null : 'state')}>
          <span className="sidebar-filter-label">STATE</span>
          <span className="sidebar-filter-value">{filterState || 'Any'}</span>
          <span className="sidebar-filter-arrow">▾</span>
          {openFilter === 'state' && (
            <div className="sidebar-filter-menu">
              <div className="sidebar-filter-option" onClick={(e) => { e.stopPropagation(); setFilterState(''); setOpenFilter(null); }}><em>Any</em></div>
              {uniqueStates.map(s => (
                <div key={s} className={`sidebar-filter-option${s === filterState ? ' active' : ''}`} onClick={(e) => { e.stopPropagation(); setFilterState(s); setOpenFilter(null); }}>{s}</div>
              ))}
            </div>
          )}
        </div>
      </div>
      <div className="location-list">
        {filteredLocations.map((loc) => (
          <div
            key={loc.name}
            className={`location-card${loc.name === selectedLocation ? ' active' : ''}`}
            onClick={() => onSelectLocation(loc.name)}
          >
            <div className="location-card-top">
              <span className="location-card-name">{loc.location} | {loc.building}</span>
            </div>
            <div className="location-card-address">{loc.street}, {loc.city}, {loc.state},</div>
            <div className="location-card-address">{loc.country} - {loc.zip}</div>
          </div>
        ))}
        {filteredLocations.length === 0 && (
          <div className="no-results">No premises found</div>
        )}
      </div>
    </div>
  );
}
