import React from 'react';

function EditIcon() {
  return (
    <img className="edit-icon" src="/edit.svg" alt="Edit" width="14" height="14" />
  );
}

export default function LeftSidebar({ selectedLocation, onSelectLocation, onAddPremise, onEditPremise, locations }) {
  const [searchQuery, setSearchQuery] = React.useState('');
  const [filterYear, setFilterYear] = React.useState('');
  const [filterLocation, setFilterLocation] = React.useState('');
  const [filterState, setFilterState] = React.useState('');
  const [filterCountry, setFilterCountry] = React.useState('');
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
  const uniqueLocations = [...new Set(locations.map(l => l.location))].sort((a, b) => {
    const numA = parseInt(a.replace(/\D/g, ''), 10) || 0;
    const numB = parseInt(b.replace(/\D/g, ''), 10) || 0;
    return numA - numB;
  });
  const uniqueStates = [...new Set(locations.map(l => l.state))].sort();
  const uniqueCountries = [...new Set(locations.map(l => l.country))].sort();

  const filteredLocations = locations.filter(loc => {
    if (filterYear && loc.yearBuilt !== filterYear) return false;
    if (filterLocation && loc.location !== filterLocation) return false;
    if (filterState && loc.state !== filterState) return false;
    if (filterCountry && loc.country !== filterCountry) return false;
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
      <div className="left-sidebar-top">
        <div className="left-sidebar-title-row">
          <span className="left-sidebar-heading">Premises</span>
          <img src="/add premise.svg" alt="Add Premise" className="add-premise-btn-img" onClick={onAddPremise} title="Add a new premise with location and building details" />
        </div>
        <div className="search-row">
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
          <img src="/search.svg" alt="Search" className="search-btn-img" onClick={() => {}} />
        </div>
        <div className="left-sidebar-filters" ref={filterRef}>
          <div className="sidebar-filters-row">
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
            <div className="sidebar-filter" onClick={() => setOpenFilter(openFilter === 'location' ? null : 'location')}>
              <span className="sidebar-filter-label">LOCATION</span>
              <span className="sidebar-filter-value">{filterLocation || 'Any'}</span>
              <span className="sidebar-filter-arrow">▾</span>
              {openFilter === 'location' && (
                <div className="sidebar-filter-menu">
                  <div className="sidebar-filter-option" onClick={(e) => { e.stopPropagation(); setFilterLocation(''); setOpenFilter(null); }}><em>Any</em></div>
                  {uniqueLocations.map(l => (
                    <div key={l} className={`sidebar-filter-option${l === filterLocation ? ' active' : ''}`} onClick={(e) => { e.stopPropagation(); setFilterLocation(l); setOpenFilter(null); }}>{l}</div>
                  ))}
                </div>
              )}
            </div>
          </div>
          <div className="sidebar-filters-row">
            <div className="sidebar-filter sidebar-filter-full" onClick={() => setOpenFilter(openFilter === 'country' ? null : 'country')}>
              <span className="sidebar-filter-label">COUNTRY</span>
              <span className="sidebar-filter-value">{filterCountry || 'Any'}</span>
              <span className="sidebar-filter-arrow">▾</span>
              {openFilter === 'country' && (
                <div className="sidebar-filter-menu">
                  <div className="sidebar-filter-option" onClick={(e) => { e.stopPropagation(); setFilterCountry(''); setOpenFilter(null); }}><em>Any</em></div>
                  {uniqueCountries.map(c => (
                    <div key={c} className={`sidebar-filter-option${c === filterCountry ? ' active' : ''}`} onClick={(e) => { e.stopPropagation(); setFilterCountry(c); setOpenFilter(null); }}>{c}</div>
                  ))}
                </div>
              )}
            </div>
          </div>
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
