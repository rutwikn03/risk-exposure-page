import React, { useState } from 'react';
import Login from './components/Login';
import TopNav from './components/TopNav';
import Header from './components/Header';
import Tabs from './components/Tabs';
import SubTabs from './components/SubTabs';
import LeftSidebar from './components/LeftSidebar';
import ScreenC2 from './components/ScreenC2';
import EditDetailsModal from './components/EditDetailsModal';
import EditPremiseModal from './components/EditPremiseModal';
import AddPremiseModal from './components/AddPremiseModal';
import CommercialAuto from './components/CommercialAuto';
import locationsData from './data/locations';
import soiDataImport from './data/soiData';
import './commercial-auto.css';

export default function App() {
  // Flow: login -> app
  const [screen, setScreen] = useState(() => {
    const saved = localStorage.getItem('app_login_ts');
    if (saved && Date.now() - parseInt(saved, 10) < 4 * 60 * 60 * 1000) {
      return 'app';
    }
    return 'login';
  });
  const [activePage, setActivePage] = useState(() => localStorage.getItem('app_active_page') || 'real-estate');
  const [locations, setLocations] = useState(locationsData);
  const [soiData, setSoiData] = useState(soiDataImport);
  const [selectedLocation, setSelectedLocation] = useState(locationsData[0].name);
  const [showAddPremise, setShowAddPremise] = useState(false);
  const [showEditDetails, setShowEditDetails] = useState(false);
  const [showEditPremise, setShowEditPremise] = useState(false);
  const [activeSubTab, setActiveSubTab] = useState('risk');

  const selectedData = locations.find(l => l.name === selectedLocation) || locations[0];

  const handleSelectLocation = (name) => setSelectedLocation(name);
  const handleGoBack = () => setSelectedLocation(locations[0]?.name || '');
  const handleEditDetails = () => setShowEditDetails(true);
  const handleCancelEdit = () => setShowEditDetails(false);
  const handleAddPremise = () => setShowAddPremise(true);
  const handleEditPremise = () => setShowEditPremise(true);

  const handleSaveLocation = (updatedData) => {
    setLocations(prev => prev.map(l => l.name === selectedLocation ? { ...l, ...updatedData } : l));
  };

  const handleSaveSoi = (rows) => {
    setSoiData(prev => ({ ...prev, [selectedLocation]: rows }));
  };

  const handleLogin = () => {
    localStorage.setItem('app_login_ts', Date.now().toString());
    setScreen('app');
  };

  const handleSelectProduct = (product) => {
    setActivePage(product);
    localStorage.setItem('app_active_page', product);
  };

  // Login screen
  if (screen === 'login') {
    return <Login onLogin={handleLogin} />;
  }

  // Main app
  return (
    <div className="app">
      <TopNav activePage={activePage} onChangePage={handleSelectProduct} />
      <Header activePage={activePage} />
      <Tabs />
      {activePage === 'commercial-auto' ? (
        <CommercialAuto />
      ) : (
        <>
          <SubTabs activeSubTab={activeSubTab} onChangeSubTab={setActiveSubTab} />
          <div className="main-content">
            {activeSubTab === 'risk' && (
              <LeftSidebar
                selectedLocation={selectedLocation}
                onSelectLocation={handleSelectLocation}
                onAddPremise={handleAddPremise}
                onEditPremise={handleEditPremise}
                locations={locations}
              />
            )}
            {activeSubTab === 'risk' ? (
              <ScreenC2
                locationName={selectedLocation}
                locationData={selectedData}
                soiData={soiData[selectedLocation] || []}
                onGoBack={handleGoBack}
                onEditDetails={handleEditDetails}
                onSaveSoi={handleSaveSoi}
                onDeletePremise={() => {
                  const remaining = locations.filter(l => l.name !== selectedLocation);
                  setLocations(remaining);
                  setSoiData(prev => { const copy = { ...prev }; delete copy[selectedLocation]; return copy; });
                  setSelectedLocation(remaining[0]?.name || '');
                }}
              />
            ) : (
              <div className="under-progress">
                <div className="under-progress-content">
                  <svg width="64" height="64" viewBox="0 0 64 64" fill="none">
                    <circle cx="32" cy="32" r="30" stroke="#2322f0" strokeWidth="3" fill="none" strokeDasharray="8 4" />
                    <path d="M24 32h16M32 24v16" stroke="#2322f0" strokeWidth="3" strokeLinecap="round" />
                  </svg>
                  <h3>Under Progress</h3>
                  <p>Loss History module is currently being developed. Check back soon.</p>
                </div>
              </div>
            )}
            {activeSubTab === 'risk' && (
              <div className="scroll-handle">
                <span className="arrow"></span>
              </div>
            )}
          </div>
          {showAddPremise && (
            <AddPremiseModal
              onClose={() => setShowAddPremise(false)}
              allLocations={locations}
              onAddPremise={(newLocation, newSoi) => {
                const updated = [...locations, newLocation].sort((a, b) => {
                  const locA = parseInt(a.location.replace(/\D/g, ''), 10) || 0;
                  const locB = parseInt(b.location.replace(/\D/g, ''), 10) || 0;
                  if (locA !== locB) return locA - locB;
                  const bldgA = parseInt(a.building.replace(/\D/g, ''), 10) || 0;
                  const bldgB = parseInt(b.building.replace(/\D/g, ''), 10) || 0;
                  return bldgA - bldgB;
                });
                setLocations(updated);
                if (newSoi.length > 0) {
                  setSoiData(prev => ({ ...prev, [newLocation.name]: newSoi }));
                }
                setSelectedLocation(newLocation.name);
                setShowAddPremise(false);
              }}
            />
          )}
          {showEditDetails && (
            <EditDetailsModal
              onClose={handleCancelEdit}
              locationData={selectedData}
              soiRows={soiData[selectedLocation] || []}
              onSaveLocation={handleSaveLocation}
              onSaveSoi={handleSaveSoi}
              onDeletePremise={() => {
                const remaining = locations.filter(l => l.name !== selectedLocation);
                setLocations(remaining);
                setSoiData(prev => { const copy = { ...prev }; delete copy[selectedLocation]; return copy; });
                setShowEditDetails(false);
                setSelectedLocation(remaining[0]?.name || '');
              }}
            />
          )}
          {showEditPremise && (
            <EditPremiseModal
              onClose={() => setShowEditPremise(false)}
              locationData={selectedData}
              soiRows={soiData[selectedLocation] || []}
              onSaveLocation={handleSaveLocation}
              onDeletePremise={() => {
                const remaining = locations.filter(l => l.name !== selectedLocation);
                setLocations(remaining);
                setSoiData(prev => { const copy = { ...prev }; delete copy[selectedLocation]; return copy; });
                setShowEditPremise(false);
                setSelectedLocation(remaining[0]?.name || '');
              }}
            />
          )}
        </>
      )}
    </div>
  );
}
