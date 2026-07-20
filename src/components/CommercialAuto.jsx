import React, { useState, useMemo } from 'react';
import AddVehicleModal from './AddVehicleModal';
import EditVehicleModal from './EditVehicleModal';
import AddDriverModal from './AddDriverModal';
import EditDriverModal from './EditDriverModal';

// Calculate LIC renewal from license issue year (avg CDL valid for 5 years)
// Since licYear is just a year, renewal is also shown in years only
function calcRenewal(licYear) {
  if (!licYear) return { renewalText: '-', renewalColor: '#999' };
  const currentYear = new Date().getFullYear();
  const issueYear = parseInt(licYear);
  const expiryYear = issueYear + 5;
  const yearsLeft = expiryYear - currentYear;
  if (yearsLeft < 0) return { renewalText: 'Expired', renewalColor: '#991B1B' };
  if (yearsLeft === 0) return { renewalText: 'Expires this yr', renewalColor: '#991B1B' };
  if (yearsLeft === 1) return { renewalText: '1 yr left', renewalColor: '#92400E' };
  return { renewalText: `${yearsLeft} yrs left`, renewalColor: '#117C00' };
}

const baseVehicles = [
  { id: 1, yearMakeModel: "2024 Ford Transit 250", bodyType: "Van", vin: "1FTBW2CM5RKA48291", address: "4521 Industrial Blvd, Dallas, TX 75207", stateLic: "TX", costNew: "$52,840", coverages: ["Liability-BI", "Liability-PD", "Collision", "Comprehensive"] },
  { id: 2, yearMakeModel: "2023 Chevy Silverado 2500HD", bodyType: "Truck", vin: "3GCPYFED2NG534812", address: "4521 Industrial Blvd, Dallas, TX 75207", stateLic: "TX", costNew: "$67,295", coverages: ["Liability-BI", "Collision", "Comprehensive", "Cargo"] },
  { id: 3, yearMakeModel: "2024 Toyota Camry LE", bodyType: "Sedan", vin: "4T1G11AK8RU092456", address: "890 Commerce Way, Los Angeles, CA 90015", stateLic: "CA", costNew: "$28,855", coverages: ["Liability-BI", "Liability-PD", "Collision"] },
  { id: 4, yearMakeModel: "2022 Freightliner Cascadia 126", bodyType: "Semi", vin: "3AKJHHDR4NSLA7834", address: "1200 Logistics Pkwy, Chicago, IL 60607", stateLic: "IL", costNew: "$178,500", coverages: ["Liability-BI", "Liability-PD", "Collision", "Cargo"] },
  { id: 5, yearMakeModel: "2024 Ram ProMaster 3500", bodyType: "Van", vin: "3C6MRVJG8RE182745", address: "3300 NW 72nd Ave, Miami, FL 33122", stateLic: "FL", costNew: "$48,120", coverages: ["Liability-BI", "Collision", "Uninsured"] },
  { id: 6, yearMakeModel: "2023 Ford F-150 Lightning", bodyType: "Truck", vin: "1FTVW1EL5NWD43678", address: "890 Commerce Way, Los Angeles, CA 90015", stateLic: "CA", costNew: "$73,490", coverages: ["Liability-BI", "Liability-PD", "Collision", "Comprehensive"] },
  { id: 7, yearMakeModel: "2024 Mercedes Sprinter 2500", bodyType: "Van", vin: "W1Y4KBHY3RT012345", address: "7820 Peachtree Rd, Atlanta, GA 30309", stateLic: "GA", costNew: "$58,900", coverages: ["Liability-BI", "Comprehensive", "Cargo"] },
  { id: 8, yearMakeModel: "2023 Peterbilt 579", bodyType: "Semi", vin: "1XPBD49X3ND567890", address: "1200 Logistics Pkwy, Chicago, IL 60607", stateLic: "IL", costNew: "$195,000", coverages: ["Liability-BI", "Liability-PD", "Cargo", "Collision"] },
  { id: 9, yearMakeModel: "2024 Honda CR-V EX", bodyType: "SUV", vin: "7FARW2H5XRE123456", address: "2100 Main St, Houston, TX 77002", stateLic: "TX", costNew: "$34,750", coverages: ["Liability-BI", "Collision", "Comprehensive"] },
  { id: 10, yearMakeModel: "2023 Isuzu NPR HD", bodyType: "Box Truck", vin: "JALB4W163R7890123", address: "500 Distribution Dr, Phoenix, AZ 85034", stateLic: "AZ", costNew: "$62,400", coverages: ["Liability-BI", "Liability-PD", "Cargo"] },
  { id: 11, yearMakeModel: "2024 Chevy Express 3500", bodyType: "Van", vin: "1GCWGBFG5R1234567", address: "9100 SW 40th St, Miami, FL 33165", stateLic: "FL", costNew: "$44,200", coverages: ["Liability-BI", "Collision", "Uninsured"] },
  { id: 12, yearMakeModel: "2022 Kenworth T680", bodyType: "Semi", vin: "1XKYD49X7NJ098765", address: "3400 Trucking Ln, Memphis, TN 38118", stateLic: "TN", costNew: "$185,600", coverages: ["Liability-BI", "Liability-PD", "Collision", "Cargo", "Comprehensive"] },
  { id: 13, yearMakeModel: "2024 Ford Explorer ST", bodyType: "SUV", vin: "1FM5K8GC5RGA54321", address: "750 Corporate Dr, Denver, CO 80202", stateLic: "CO", costNew: "$56,700", coverages: ["Liability-BI", "Collision", "Comprehensive", "Uninsured"] },
  { id: 14, yearMakeModel: "2023 Toyota Tacoma TRD", bodyType: "Truck", vin: "3TMCZ5AN4NM876543", address: "2100 Main St, Houston, TX 77002", stateLic: "TX", costNew: "$42,350", coverages: ["Liability-BI", "Liability-PD", "Collision"] },
  { id: 15, yearMakeModel: "2024 Nissan NV200", bodyType: "Van", vin: "3N6CM0KN8RK111222", address: "1500 Market St, Philadelphia, PA 19102", stateLic: "PA", costNew: "$31,500", coverages: ["Liability-BI", "Collision"] },
  { id: 16, yearMakeModel: "2023 GMC Sierra 3500HD", bodyType: "Truck", vin: "1GT49VEY5NF333444", address: "4521 Industrial Blvd, Dallas, TX 75207", stateLic: "TX", costNew: "$78,900", coverages: ["Liability-BI", "Liability-PD", "Collision", "Comprehensive", "Cargo"] },
  { id: 17, yearMakeModel: "2024 Volvo VNL 860", bodyType: "Semi", vin: "4V4NC9EH7RN555666", address: "8900 I-40 West, Amarillo, TX 79106", stateLic: "TX", costNew: "$210,000", coverages: ["Liability-BI", "Liability-PD", "Cargo", "Collision", "Medical Payments"] },
  { id: 18, yearMakeModel: "2023 Hino L6", bodyType: "Box Truck", vin: "5PVN34BV2N4777888", address: "600 Harbor Blvd, Long Beach, CA 90802", stateLic: "CA", costNew: "$72,300", coverages: ["Liability-BI", "Collision", "Cargo"] },
  { id: 19, yearMakeModel: "2024 Jeep Grand Cherokee L", bodyType: "SUV", vin: "1C4RJKBG5R8999000", address: "312 E 84th St, New York, NY 10028", stateLic: "NY", costNew: "$52,100", coverages: ["Liability-BI", "Comprehensive", "Collision", "Uninsured"] },
  { id: 20, yearMakeModel: "2023 Ford E-Transit", bodyType: "Van", vin: "1FTBW9CK5NKA11223", address: "890 Commerce Way, Los Angeles, CA 90015", stateLic: "CA", costNew: "$55,600", coverages: ["Liability-BI", "Liability-PD", "Collision"] },
  { id: 21, yearMakeModel: "2024 Mack Anthem", bodyType: "Semi", vin: "1M1AN07Y7RM334455", address: "1200 Logistics Pkwy, Chicago, IL 60607", stateLic: "IL", costNew: "$192,800", coverages: ["Liability-BI", "Liability-PD", "Cargo", "Collision", "Comprehensive"] },
  { id: 22, yearMakeModel: "2023 Chevy Colorado ZR2", bodyType: "Truck", vin: "1GCPTEE12P1566677", address: "3300 NW 72nd Ave, Miami, FL 33122", stateLic: "FL", costNew: "$46,800", coverages: ["Liability-BI", "Collision", "Comprehensive"] },
  { id: 23, yearMakeModel: "2024 Dodge Durango SRT", bodyType: "SUV", vin: "1C4SDJGJ5RC788899", address: "750 Corporate Dr, Denver, CO 80202", stateLic: "CO", costNew: "$68,500", coverages: ["Liability-BI", "Liability-PD", "Collision", "Comprehensive", "Towing"] },
  { id: 24, yearMakeModel: "2022 International LT625", bodyType: "Semi", vin: "3HSDJAPR4NN900011", address: "8900 I-40 West, Amarillo, TX 79106", stateLic: "TX", costNew: "$175,400", coverages: ["Liability-BI", "Liability-PD", "Cargo", "Collision"] },
];

const baseDrivers = [
  { id: 1, fullName: "Marcus D. Johnson", sex: "Male", licNum: "3849 2918 8291", stateLic: "TX", licYear: "2023", yrsExp: "12", dateHired: "Mar 2019", address: "1847 Elm Creek Dr, Arlington, TX", dob: "1987-04-12", maritalStatus: "Married" },
  { id: 2, fullName: "Sarah K. Okonkwo", sex: "Female", licNum: "D723 4567", stateLic: "CA", licYear: "2022", yrsExp: "8", dateHired: "Jun 2021", address: "2290 Sunset Blvd, LA, CA", dob: "1992-08-23", maritalStatus: "Single" },
  { id: 3, fullName: "Robert A. Chen", sex: "Male", licNum: "C432 1010 98", stateLic: "IL", licYear: "2023", yrsExp: "22", dateHired: "Jan 2017", address: "4410 N Ashland Ave, Chicago, IL", dob: "1978-11-05", maritalStatus: "Married" },
  { id: 4, fullName: "Diana L. Morales", sex: "Female", licNum: "M893 4782 3", stateLic: "FL", licYear: "2020", yrsExp: "5", dateHired: "Nov 2022", address: "780 Brickell Ave, Miami, FL", dob: "1995-02-18", maritalStatus: "Single" },
  { id: 5, fullName: "James T. Whitfield", sex: "Male", licNum: "W293 8554 0", stateLic: "NY", licYear: "2024", yrsExp: "15", dateHired: "Apr 2018", address: "312 E 84th St, New York, NY", dob: "1983-06-30", maritalStatus: "Married" },
  { id: 6, fullName: "Priya R. Nair", sex: "Female", licNum: "N567 8210 9", stateLic: "TX", licYear: "2022", yrsExp: "3", dateHired: "Sep 2023", address: "6701 Forest Ln, Dallas, TX", dob: "1997-09-14", maritalStatus: "Single" },
  { id: 7, fullName: "Anthony B. Rivera", sex: "Male", licNum: "R234 5678 1", stateLic: "GA", licYear: "2023", yrsExp: "9", dateHired: "Feb 2020", address: "3420 Peachtree Rd NE, Atlanta, GA", dob: "1990-01-22", maritalStatus: "Married" },
  { id: 8, fullName: "Michelle K. Thompson", sex: "Female", licNum: "T891 2345 6", stateLic: "TX", licYear: "2024", yrsExp: "18", dateHired: "Aug 2016", address: "5500 Preston Rd, Dallas, TX", dob: "1980-07-09", maritalStatus: "Divorced" },
  { id: 9, fullName: "David W. Park", sex: "Male", licNum: "P456 7890 2", stateLic: "CA", licYear: "2021", yrsExp: "6", dateHired: "Jan 2022", address: "1800 Ocean Ave, Santa Monica, CA", dob: "1993-12-03", maritalStatus: "Single" },
  { id: 10, fullName: "Lisa M. O'Brien", sex: "Female", licNum: "O123 4567 8", stateLic: "IL", licYear: "2020", yrsExp: "2", dateHired: "Mar 2024", address: "2200 W Division St, Chicago, IL", dob: "1999-05-27", maritalStatus: "Single" },
  { id: 11, fullName: "Carlos E. Gutierrez", sex: "Male", licNum: "G678 9012 3", stateLic: "FL", licYear: "2024", yrsExp: "25", dateHired: "Jun 2014", address: "900 Biscayne Blvd, Miami, FL", dob: "1975-03-16", maritalStatus: "Married" },
  { id: 12, fullName: "Jennifer A. Walsh", sex: "Female", licNum: "W345 6789 0", stateLic: "NY", licYear: "2023", yrsExp: "11", dateHired: "Oct 2019", address: "450 W 33rd St, New York, NY", dob: "1988-10-08", maritalStatus: "Married" },
  { id: 13, fullName: "Kevin R. Patel", sex: "Male", licNum: "P789 0123 4", stateLic: "TX", licYear: "2022", yrsExp: "4", dateHired: "May 2023", address: "2100 Main St, Houston, TX", dob: "1996-07-21", maritalStatus: "Single" },
  { id: 14, fullName: "Amanda J. Foster", sex: "Female", licNum: "F012 3456 7", stateLic: "CO", licYear: "2024", yrsExp: "14", dateHired: "Sep 2018", address: "750 Corporate Dr, Denver, CO", dob: "1984-12-11", maritalStatus: "Married" },
  { id: 15, fullName: "William H. Nakamura", sex: "Male", licNum: "N890 1234 5", stateLic: "CA", licYear: "2020", yrsExp: "7", dateHired: "Dec 2020", address: "600 Harbor Blvd, Long Beach, CA", dob: "1991-04-29", maritalStatus: "Single" },
  { id: 16, fullName: "Stephanie L. Adams", sex: "Female", licNum: "A567 8901 2", stateLic: "TN", licYear: "2025", yrsExp: "20", dateHired: "Mar 2015", address: "3400 Trucking Ln, Memphis, TN", dob: "1979-08-14", maritalStatus: "Divorced" },
  { id: 17, fullName: "Brian P. Kowalski", sex: "Male", licNum: "K234 5678 9", stateLic: "PA", licYear: "2022", yrsExp: "10", dateHired: "Jul 2020", address: "1500 Market St, Philadelphia, PA", dob: "1989-02-06", maritalStatus: "Married" },
  { id: 18, fullName: "Rachel N. Singh", sex: "Female", licNum: "S901 2345 6", stateLic: "TX", licYear: "2023", yrsExp: "16", dateHired: "Apr 2017", address: "8900 I-40 West, Amarillo, TX", dob: "1982-11-19", maritalStatus: "Married" },
  { id: 19, fullName: "Thomas G. Fitzgerald", sex: "Male", licNum: "F678 9012 3", stateLic: "IL", licYear: "2021", yrsExp: "1", dateHired: "Jan 2025", address: "1200 Logistics Pkwy, Chicago, IL", dob: "2000-06-03", maritalStatus: "Single" },
  { id: 20, fullName: "Olivia C. Yamamoto", sex: "Female", licNum: "Y345 6789 0", stateLic: "FL", licYear: "2025", yrsExp: "19", dateHired: "Nov 2015", address: "9100 SW 40th St, Miami, FL", dob: "1981-09-25", maritalStatus: "Married" },
  { id: 21, fullName: "Derek M. Sullivan", sex: "Male", licNum: "S012 3456 7", stateLic: "NY", licYear: "2023", yrsExp: "13", dateHired: "Aug 2019", address: "789 Broadway, New York, NY", dob: "1986-03-17", maritalStatus: "Divorced" },
  { id: 22, fullName: "Maria T. Vasquez", sex: "Female", licNum: "V789 0123 4", stateLic: "CA", licYear: "2020", yrsExp: "8", dateHired: "Feb 2021", address: "890 Commerce Way, Los Angeles, CA", dob: "1994-01-08", maritalStatus: "Single" },
  { id: 23, fullName: "Patrick J. Murphy", sex: "Male", licNum: "M456 7890 1", stateLic: "GA", licYear: "2024", yrsExp: "17", dateHired: "Jun 2016", address: "7820 Peachtree Rd, Atlanta, GA", dob: "1981-05-22", maritalStatus: "Married" },
  { id: 24, fullName: "Nicole R. Kim", sex: "Female", licNum: "K123 4567 8", stateLic: "TX", licYear: "2022", yrsExp: "6", dateHired: "Apr 2022", address: "4521 Industrial Blvd, Dallas, TX", dob: "1996-10-30", maritalStatus: "Single" },
];

const bodyTypeColors = { Van: "#2322F0", Truck: "#117C00", Sedan: "#636363", Semi: "#92400E", SUV: "#555", "Box Truck": "#333" };

export default function CommercialAuto() {
  const [vehicles, setVehicles] = useState(baseVehicles);
  const [drivers, setDrivers] = useState(baseDrivers);
  const [activeNav, setActiveNav] = useState("vehicles");
  const [activeView, setActiveView] = useState("cards");
  const [activeSubTab, setActiveSubTab] = useState("risk");
  const [vehicleSearch, setVehicleSearch] = useState("");
  const [driverSearch, setDriverSearch] = useState("");
  const [filterBodyType, setFilterBodyType] = useState("");
  const [filterVState, setFilterVState] = useState("");
  const [filterDState, setFilterDState] = useState("");
  const [filterExp, setFilterExp] = useState("");
  const [showAddVehicle, setShowAddVehicle] = useState(false);
  const [showEditVehicle, setShowEditVehicle] = useState(false);
  const [showAddDriver, setShowAddDriver] = useState(false);
  const [showEditDriver, setShowEditDriver] = useState(false);
  const [editingVehicle, setEditingVehicle] = useState(null);
  const [editingDriver, setEditingDriver] = useState(null);
  const [deleteConfirm, setDeleteConfirm] = useState(null); // { type: 'vehicle'|'driver', id, name }

  const filteredVehicles = useMemo(() => {
    let result = vehicles;
    if (vehicleSearch) {
      const s = vehicleSearch.toLowerCase();
      result = result.filter(v =>
        v.yearMakeModel.toLowerCase().includes(s) ||
        v.vin.toLowerCase().includes(s) ||
        v.address.toLowerCase().includes(s)
      );
    }
    if (filterBodyType) result = result.filter(v => v.bodyType === filterBodyType);
    if (filterVState) result = result.filter(v => v.stateLic === filterVState);
    return result;
  }, [vehicles, vehicleSearch, filterBodyType, filterVState]);

  const filteredDrivers = useMemo(() => {
    let result = drivers;
    if (driverSearch) {
      const s = driverSearch.toLowerCase();
      result = result.filter(d =>
        d.fullName.toLowerCase().includes(s) ||
        d.licNum.toLowerCase().includes(s) ||
        d.address.toLowerCase().includes(s)
      );
    }
    if (filterDState) result = result.filter(d => d.stateLic === filterDState);
    if (filterExp) {
      result = result.filter(d => {
        const exp = parseInt(d.yrsExp);
        if (filterExp === "20+") return exp >= 20;
        const [min, max] = filterExp.split("-").map(Number);
        return exp >= min && exp <= max;
      });
    }
    return result;
  }, [drivers, driverSearch, filterDState, filterExp]);

  return (
    <div className="ca-page">
      {/* Sub-tabs: same style as property page */}
      <div className="sub-tabs">
        <a
          className={`sub-tab${activeSubTab === 'loss' ? ' active' : ''}`}
          href="#"
          onClick={(e) => { e.preventDefault(); setActiveSubTab('loss'); }}
        >
          Loss History
        </a>
        <a
          className={`sub-tab${activeSubTab === 'risk' ? ' active' : ''}`}
          href="#"
          onClick={(e) => { e.preventDefault(); setActiveSubTab('risk'); }}
        >
          Risk Exposure
        </a>
      </div>

      {activeSubTab === 'loss' ? (
        <div className="under-progress">
          <div className="under-progress-content">
            <svg width="64" height="64" viewBox="0 0 64 64" fill="none">
              <circle cx="32" cy="32" r="30" stroke="#2322f0" strokeWidth="3" fill="none" strokeDasharray="8 4" />
              <path d="M24 32h16M32 24v16" stroke="#2322f0" strokeWidth="3" strokeLinecap="round" />
            </svg>
            <h3>Under Progress</h3>
            <p>Loss History module is currently being developed.</p>
          </div>
        </div>
      ) : (
      <div className="ca-main">
        {/* Left Nav - text only with left blue bar for active */}
        <div className="ca-left-nav">
          <div
            className={`ca-nav-link ${activeNav === "vehicles" ? "ca-nav-link--active" : ""}`}
            onClick={() => setActiveNav("vehicles")}
          >
            Vehicle Information
          </div>
          <div
            className={`ca-nav-link ${activeNav === "drivers" ? "ca-nav-link--active" : ""}`}
            onClick={() => setActiveNav("drivers")}
          >
            Driver Information
          </div>
        </div>

        <div className="ca-pane-divider" />

        {/* Right Content */}
        <div className="ca-right-content">
          {/* Sticky header area */}
          <div className="ca-right-sticky">
            {/* Header row: Title left, Add + Edit + View toggle right */}
            <div className="ca-content-header">
              <h2 className="ca-content-title">
                {activeNav === "vehicles" ? "Vehicle Information" : "Driver Information"}
              </h2>
              <div className="ca-header-actions">
                <img
                  src={activeNav === "vehicles" ? "/add vehicle.svg" : "/add driver.svg"}
                  alt={activeNav === "vehicles" ? "Add Vehicle" : "Add Driver"}
                  className="add-premise-btn-img"
                  onClick={() => activeNav === "vehicles" ? setShowAddVehicle(true) : setShowAddDriver(true)}
                  title={activeNav === "vehicles" ? "Add a new vehicle" : "Add a new driver"}
                />
                <img
                  src="/edit button.svg"
  
                  alt={activeNav === "vehicles" ? "Edit Vehicle Details" : "Edit Driver Details"}
                  className="header-action-img"
                  onClick={() => activeNav === "vehicles" ? setShowEditVehicle(true) : setShowEditDriver(true)}
                  title={activeNav === "vehicles" ? "Edit vehicle details" : "Edit driver details"}
                />
              </div>
            </div>

          {/* Search + Filters + View Toggle inline */}
          {activeNav === "vehicles" ? (
            <div className="ca-filter-bar">
              <div className="search-row">
                <div className="search-box">
                  <svg width="12" height="12" viewBox="0 0 12 12" fill="none">
                    <circle cx="5" cy="5" r="4" stroke="#767676" strokeWidth="1.2" />
                    <line x1="8" y1="8" x2="11" y2="11" stroke="#767676" strokeWidth="1.2" />
                  </svg>
                  <input type="text" placeholder="Search vehicles..." value={vehicleSearch} onChange={e => setVehicleSearch(e.target.value)} />
                  {vehicleSearch && <span style={{ cursor: 'pointer', color: '#999', fontSize: 14 }} onClick={() => setVehicleSearch('')}>✕</span>}
                </div>
                <img src="/search.svg" alt="Search" className="search-btn-img" />
              </div>
              <div className="sidebar-filters-row">
                <FilterDropdown label="BODY TYPE" value={filterBodyType} options={["Van","Truck","Sedan","SUV","Semi","Box Truck"]} onChange={setFilterBodyType} />
                <FilterDropdown label="STATE LIC" value={filterVState} options={["TX","CA","IL","FL","NY","GA","CO","TN","PA","AZ"]} onChange={setFilterVState} />
                <div className="ca-view-toggle">
                  <button className={`ca-toggle-btn ${activeView === "cards" ? "ca-toggle-btn--active" : ""}`} onClick={() => setActiveView("cards")}>
                    <svg width="14" height="14" viewBox="0 0 16 16" fill="currentColor"><rect x="1" y="1" width="6" height="6" rx="1" /><rect x="9" y="1" width="6" height="6" rx="1" /><rect x="1" y="9" width="6" height="6" rx="1" /><rect x="9" y="9" width="6" height="6" rx="1" /></svg>
                    Cards
                  </button>
                  <button className={`ca-toggle-btn ${activeView === "grid" ? "ca-toggle-btn--active" : ""}`} onClick={() => setActiveView("grid")}>
                    <svg width="14" height="14" viewBox="0 0 16 16" fill="currentColor"><rect x="1" y="2" width="14" height="2" rx="0.5" /><rect x="1" y="7" width="14" height="2" rx="0.5" /><rect x="1" y="12" width="14" height="2" rx="0.5" /></svg>
                    Grid
                  </button>
                </div>
              </div>
            </div>
          ) : (
            <div className="ca-filter-bar">
              <div className="search-row">
                <div className="search-box">
                  <svg width="12" height="12" viewBox="0 0 12 12" fill="none">
                    <circle cx="5" cy="5" r="4" stroke="#767676" strokeWidth="1.2" />
                    <line x1="8" y1="8" x2="11" y2="11" stroke="#767676" strokeWidth="1.2" />
                  </svg>
                  <input type="text" placeholder="Search drivers..." value={driverSearch} onChange={e => setDriverSearch(e.target.value)} />
                  {driverSearch && <span style={{ cursor: 'pointer', color: '#999', fontSize: 14 }} onClick={() => setDriverSearch('')}>✕</span>}
                </div>
                <img src="/search.svg" alt="Search" className="search-btn-img" />
              </div>
              <div className="sidebar-filters-row">
                <FilterDropdown label="STATE LIC" value={filterDState} options={["TX","CA","IL","FL","NY","GA","CO","TN","PA","AZ"]} onChange={setFilterDState} />
                <FilterDropdown label="EXPERIENCE" value={filterExp} options={["0-5","6-10","11-15","16-20","20+"]} labels={["0-5 yrs","6-10 yrs","11-15 yrs","16-20 yrs","20+ yrs"]} onChange={setFilterExp} />
                <div className="ca-view-toggle">
                  <button className={`ca-toggle-btn ${activeView === "cards" ? "ca-toggle-btn--active" : ""}`} onClick={() => setActiveView("cards")}>
                    <svg width="14" height="14" viewBox="0 0 16 16" fill="currentColor"><rect x="1" y="1" width="6" height="6" rx="1" /><rect x="9" y="1" width="6" height="6" rx="1" /><rect x="1" y="9" width="6" height="6" rx="1" /><rect x="9" y="9" width="6" height="6" rx="1" /></svg>
                    Cards
                  </button>
                  <button className={`ca-toggle-btn ${activeView === "grid" ? "ca-toggle-btn--active" : ""}`} onClick={() => setActiveView("grid")}>
                    <svg width="14" height="14" viewBox="0 0 16 16" fill="currentColor"><rect x="1" y="2" width="14" height="2" rx="0.5" /><rect x="1" y="7" width="14" height="2" rx="0.5" /><rect x="1" y="12" width="14" height="2" rx="0.5" /></svg>
                    Grid
                  </button>
                </div>
              </div>
            </div>
          )}

          </div>
          {/* end sticky */}

          {/* Scrollable content area */}
          <div className="ca-scroll-area">
            {activeNav === "vehicles" ? (
              activeView === "cards" ? <VehicleCards vehicles={filteredVehicles} onEdit={(v) => setEditingVehicle(v)} onDelete={(id) => { const v = vehicles.find(x => x.id === id); setDeleteConfirm({ type: 'vehicle', id, name: v?.yearMakeModel || '' }); }} /> : <VehicleGrid vehicles={filteredVehicles} />
            ) : (
              activeView === "cards" ? <DriverCards drivers={filteredDrivers} onEdit={(d) => setEditingDriver(d)} onDelete={(id) => { const d = drivers.find(x => x.id === id); setDeleteConfirm({ type: 'driver', id, name: d?.fullName || '' }); }} /> : <DriverGrid drivers={filteredDrivers} />
            )}
          </div>
        </div>
      </div>
      )}

      {/* Modals */}
      {showAddVehicle && (
        <AddVehicleModal
          onClose={() => setShowAddVehicle(false)}
          onAdd={(newVehicle) => { setVehicles(prev => [...prev, newVehicle]); setShowAddVehicle(false); }}
        />
      )}
      {showEditVehicle && (
        <EditVehicleModal
          onClose={() => setShowEditVehicle(false)}
          vehicles={vehicles}
          onSave={(updated) => setVehicles(updated)}
        />
      )}
      {showAddDriver && (
        <AddDriverModal
          onClose={() => setShowAddDriver(false)}
          onAdd={(newDriver) => { setDrivers(prev => [...prev, newDriver]); setShowAddDriver(false); }}
        />
      )}
      {showEditDriver && (
        <EditDriverModal
          onClose={() => setShowEditDriver(false)}
          drivers={drivers}
          onSave={(updated) => setDrivers(updated)}
        />
      )}
      {editingVehicle && (
        <SingleEditVehicleModal
          vehicle={editingVehicle}
          onClose={() => setEditingVehicle(null)}
          onSave={(updated) => { setVehicles(prev => prev.map(v => v.id === updated.id ? updated : v)); setEditingVehicle(null); }}
        />
      )}
      {editingDriver && (
        <SingleEditDriverModal
          driver={editingDriver}
          onClose={() => setEditingDriver(null)}
          onSave={(updated) => { setDrivers(prev => prev.map(d => d.id === updated.id ? updated : d)); setEditingDriver(null); }}
        />
      )}
      {deleteConfirm && (
        <div className="modal-overlay" onClick={() => setDeleteConfirm(null)}>
          <div className="ca-delete-confirm" onClick={e => e.stopPropagation()}>
            <h3 className="ca-delete-confirm-title">Delete {deleteConfirm.type === 'vehicle' ? 'Vehicle' : 'Driver'}</h3>
            <p className="ca-delete-confirm-msg">Are you sure you want to delete <strong>{deleteConfirm.name}</strong>? This action cannot be undone.</p>
            <div className="ca-delete-confirm-btns">
              <button className="btn-cancel" onClick={() => setDeleteConfirm(null)}>CANCEL</button>
              <button className="ca-delete-confirm-btn" onClick={() => {
                if (deleteConfirm.type === 'vehicle') setVehicles(prev => prev.filter(x => x.id !== deleteConfirm.id));
                else setDrivers(prev => prev.filter(x => x.id !== deleteConfirm.id));
                setDeleteConfirm(null);
              }}>DELETE</button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

function VehicleCards({ vehicles, onEdit, onDelete }) {
  const [menuOpen, setMenuOpen] = React.useState(null);
  const menuRef = React.useRef(null);

  React.useEffect(() => {
    function handleClickOutside(e) {
      if (menuRef.current && !menuRef.current.contains(e.target)) setMenuOpen(null);
    }
    if (menuOpen !== null) {
      document.addEventListener('mousedown', handleClickOutside);
      return () => document.removeEventListener('mousedown', handleClickOutside);
    }
  }, [menuOpen]);

  const rows = [];
  for (let i = 0; i < vehicles.length; i += 3) {
    rows.push(vehicles.slice(i, i + 3));
  }
  return (
    <div className="ca-cards-container" ref={menuRef}>
      {rows.map((row, ri) => (
        <div className="ca-card-row" key={ri}>
          {row.map(v => (
            <div className="ca-card" key={v.id}>
              <div className="ca-card-top-row">
                <span className="ca-card-title">{v.yearMakeModel}</span>
                <span className="ca-card-tag" style={{ background: (bodyTypeColors[v.bodyType] || "#636363") + '18', color: bodyTypeColors[v.bodyType] || "#636363" }}>{v.bodyType}</span>
                <span className="ca-card-menu-wrap">
                  <img src="/ra-menu-icon.svg" alt="Menu" className="ca-card-menu-icon" onClick={(e) => { e.stopPropagation(); setMenuOpen(menuOpen === v.id ? null : v.id); }} />
                  {menuOpen === v.id && (
                    <div className="ca-card-menu">
                      <div className="ca-card-menu-item" onClick={() => { onEdit(v); setMenuOpen(null); }}>
                        Edit Details
                      </div>
                      <div className="ca-card-menu-item ca-card-menu-item--danger" onClick={() => { onDelete(v.id); setMenuOpen(null); }}>
                        Delete Vehicle
                      </div>
                    </div>
                  )}
                </span>
              </div>
              <div className="ca-card-info-row">
                <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="#999" strokeWidth="2"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0118 0z" /><circle cx="12" cy="10" r="3" /></svg>
                <span className="ca-card-secondary">{v.address}</span>
              </div>
              <div className="ca-card-divider" />
              <div className="ca-card-meta">
                <div className="ca-card-meta-item">
                  <span className="ca-card-meta-label">VIN</span>
                  <span className="ca-card-meta-value">{v.vin}</span>
                </div>
                <div className="ca-card-meta-item">
                  <span className="ca-card-meta-label">State</span>
                  <span className="ca-card-meta-value">{v.stateLic}</span>
                </div>
                <div className="ca-card-meta-item">
                  <span className="ca-card-meta-label">Cost New</span>
                  <span className="ca-card-meta-value">{v.costNew}</span>
                </div>
              </div>
              {v.coverages && v.coverages.length > 0 && (
                <div className="ca-card-coverages">
                  {v.coverages.map(c => <span className="ca-card-cov-tag" key={c}>{c}</span>)}
                </div>
              )}
            </div>
          ))}
          {row.length < 3 && Array.from({ length: 3 - row.length }).map((_, i) => (
            <div className="ca-card ca-card--empty" key={`empty-${i}`} />
          ))}
        </div>
      ))}
    </div>
  );
}

function VehicleGrid({ vehicles }) {
  return (
    <div className="ca-grid-wrapper">
      <table className="ca-grid">
        <thead>
          <tr>
            <th>Year, Make, Model</th>
            <th>Body Type</th>
            <th>V.I.N</th>
            <th>Address</th>
            <th>State</th>
            <th>Cost New</th>
            <th>Coverages</th>
          </tr>
        </thead>
        <tbody>
          {vehicles.map(v => (
            <tr key={v.id}>
              <td>{v.yearMakeModel}</td>
              <td>{v.bodyType}</td>
              <td>{v.vin}</td>
              <td>{v.address}</td>
              <td>{v.stateLic}</td>
              <td>{v.costNew}</td>
              <td className="ca-grid-coverages">
                <CoverageCell coverages={v.coverages || []} />
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

function DriverCards({ drivers, onEdit, onDelete }) {
  const [menuOpen, setMenuOpen] = React.useState(null);
  const menuRef = React.useRef(null);

  React.useEffect(() => {
    function handleClickOutside(e) {
      if (menuRef.current && !menuRef.current.contains(e.target)) setMenuOpen(null);
    }
    if (menuOpen !== null) {
      document.addEventListener('mousedown', handleClickOutside);
      return () => document.removeEventListener('mousedown', handleClickOutside);
    }
  }, [menuOpen]);

  const rows = [];
  for (let i = 0; i < drivers.length; i += 3) {
    rows.push(drivers.slice(i, i + 3));
  }
  return (
    <div className="ca-cards-container" ref={menuRef}>
      {rows.map((row, ri) => (
        <div className="ca-card-row" key={ri}>
          {row.map(d => (
            <div className="ca-card" key={d.id}>
              <div className="ca-card-top-row">
                <span className="ca-card-title">{d.fullName}</span>
                <span className="ca-card-tag ca-card-tag--neutral">{d.sex}</span>
                <span className="ca-card-menu-wrap">
                  <img src="/ra-menu-icon.svg" alt="Menu" className="ca-card-menu-icon" onClick={(e) => { e.stopPropagation(); setMenuOpen(menuOpen === d.id ? null : d.id); }} />
                  {menuOpen === d.id && (
                    <div className="ca-card-menu">
                      <div className="ca-card-menu-item" onClick={() => { onEdit(d); setMenuOpen(null); }}>
                        Edit Details
                      </div>
                      <div className="ca-card-menu-item ca-card-menu-item--danger" onClick={() => { onDelete(d.id); setMenuOpen(null); }}>
                        Delete Driver
                      </div>
                    </div>
                  )}
                </span>
              </div>
              <div className="ca-card-info-row">
                <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="#999" strokeWidth="2"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0118 0z" /><circle cx="12" cy="10" r="3" /></svg>
                <span className="ca-card-secondary">{d.address}</span>
              </div>
              <div className="ca-card-divider" />
              <div className="ca-card-meta">
                <div className="ca-card-meta-item">
                  <span className="ca-card-meta-label">License #</span>
                  <span className="ca-card-meta-value">{d.licNum}</span>
                </div>
                <div className="ca-card-meta-item">
                  <span className="ca-card-meta-label">State</span>
                  <span className="ca-card-meta-value">{d.stateLic}</span>
                </div>
                <div className="ca-card-meta-item">
                  <span className="ca-card-meta-label">Experience</span>
                  <span className="ca-card-meta-value">{d.yrsExp} yrs</span>
                </div>
              </div>
              <div className="ca-card-meta">
                <div className="ca-card-meta-item">
                  <span className="ca-card-meta-label">DOB</span>
                  <span className="ca-card-meta-value">{d.dob || '-'}</span>
                </div>
                <div className="ca-card-meta-item">
                  <span className="ca-card-meta-label">Hired</span>
                  <span className="ca-card-meta-value">{d.dateHired}</span>
                </div>
                <div className="ca-card-meta-item">
                  <span className="ca-card-meta-label">Yr LIC / Renewal</span>
                  {(() => { const r = calcRenewal(d.licYear); return <span className="ca-card-meta-value" style={{ color: r.renewalColor }}>{d.licYear || '-'} · {r.renewalText}</span>; })()}
                </div>
              </div>
            </div>
          ))}
          {row.length < 3 && Array.from({ length: 3 - row.length }).map((_, i) => (
            <div className="ca-card ca-card--empty" key={`empty-${i}`} />
          ))}
        </div>
      ))}
    </div>
  );
}

function DriverGrid({ drivers }) {
  return (
    <div className="ca-grid-wrapper">
      <table className="ca-grid">
        <thead>
          <tr>
            <th>Full Name</th>
            <th>Sex</th>
            <th>DOB</th>
            <th>Marital Status</th>
            <th>License #</th>
            <th>State</th>
            <th>Experience</th>
            <th>Date Hired</th>
            <th>Yr LIC / Renewal</th>
          </tr>
        </thead>
        <tbody>
          {drivers.map(d => {
            const r = calcRenewal(d.licYear);
            return (
              <tr key={d.id}>
                <td>{d.fullName}</td>
                <td>{d.sex}</td>
                <td>{d.dob || '-'}</td>
                <td>{d.maritalStatus || '-'}</td>
                <td>{d.licNum}</td>
                <td>{d.stateLic}</td>
                <td>{d.yrsExp} yrs</td>
                <td>{d.dateHired}</td>
                <td style={{ color: r.renewalColor, fontWeight: 600 }}>{d.licYear || '-'} · {r.renewalText}</td>
              </tr>
            );
          })}
        </tbody>
      </table>
    </div>
  );
}

const ALL_COVERAGES_LIST = [
  "Liability-BI", "Liability-PD", "Collision", "Comprehensive",
  "Cargo", "Uninsured", "Underinsured", "Medical Payments",
  "Personal Injury", "Rental Reimbursement", "Towing", "Gap Coverage"
];

function SingleEditVehicleModal({ vehicle, onClose, onSave }) {
  const [data, setData] = React.useState({ ...vehicle, coverages: vehicle.coverages || [] });
  const update = (k, v) => setData(prev => ({ ...prev, [k]: v }));
  const toggleCov = (cov) => setData(prev => ({ ...prev, coverages: prev.coverages.includes(cov) ? prev.coverages.filter(c => c !== cov) : [...prev.coverages, cov] }));
  const removeCov = (cov) => setData(prev => ({ ...prev, coverages: prev.coverages.filter(c => c !== cov) }));
  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className="edit-modal" onClick={e => e.stopPropagation()}>
        <div className="edit-modal-header"><h1 className="modal-main-heading">Edit Vehicle</h1></div>
        <div className="edit-modal-body">
          <div className="edit-modal-card">
            <div className="edit-modal-row">
              <div className="edit-modal-field" style={{ flex: 1 }}><label>Year, Make, Model</label><input type="text" value={data.yearMakeModel} onChange={e => update('yearMakeModel', e.target.value)} /></div>
              <div className="edit-modal-field" style={{ width: 150 }}><label>Body Type</label><select value={data.bodyType} onChange={e => update('bodyType', e.target.value)} className="modal-select"><option value="Van">Van</option><option value="Truck">Truck</option><option value="Sedan">Sedan</option><option value="SUV">SUV</option><option value="Semi">Semi</option><option value="Box Truck">Box Truck</option></select></div>
            </div>
            <div className="edit-modal-row">
              <div className="edit-modal-field" style={{ flex: 1 }}><label>V.I.N</label><input type="text" value={data.vin} onChange={e => update('vin', e.target.value)} /></div>
              <div className="edit-modal-field" style={{ width: 150 }}><label>Cost New</label><input type="text" value={data.costNew} onChange={e => update('costNew', e.target.value)} /></div>
              <div className="edit-modal-field" style={{ width: 80 }}><label>State</label><input type="text" value={data.stateLic} onChange={e => update('stateLic', e.target.value)} /></div>
            </div>
            <div className="edit-modal-row">
              <div className="edit-modal-field" style={{ flex: 1 }}><label>Address</label><input type="text" value={data.address} onChange={e => update('address', e.target.value)} /></div>
            </div>
          </div>
          <div className="edit-modal-card" style={{ marginTop: 12 }}>
            <label style={{ fontSize: 13, fontWeight: 600, marginBottom: 6, display: 'block' }}>Coverages</label>
            <div className="cov-selected-box">
              {data.coverages.length === 0 && <span className="cov-placeholder">No coverages</span>}
              {data.coverages.map(c => <span className="cov-tag cov-tag--selected" key={c}>{c}<span className="cov-tag-remove" onClick={() => removeCov(c)}>✕</span></span>)}
            </div>
            <div className="cov-available">{ALL_COVERAGES_LIST.map(c => <span key={c} className={`cov-tag ${data.coverages.includes(c) ? 'cov-tag--active' : ''}`} onClick={() => toggleCov(c)}>{c}</span>)}</div>
          </div>
        </div>
        <div className="edit-modal-footer"><button className="btn-cancel" onClick={onClose}>CANCEL</button><button className="btn-add-submit" onClick={() => onSave(data)}>SAVE</button></div>
      </div>
    </div>
  );
}

function SingleEditDriverModal({ driver, onClose, onSave }) {
  const [data, setData] = React.useState({ ...driver });
  const update = (k, v) => setData(prev => ({ ...prev, [k]: v }));
  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className="edit-modal" onClick={e => e.stopPropagation()}>
        <div className="edit-modal-header"><h1 className="modal-main-heading">Edit Driver</h1></div>
        <div className="edit-modal-body">
          <div className="edit-modal-card">
            <div className="edit-modal-row">
              <div className="edit-modal-field" style={{ flex: 1 }}><label>Full Name</label><input type="text" value={data.fullName} onChange={e => update('fullName', e.target.value)} /></div>
              <div className="edit-modal-field" style={{ width: 120 }}><label>Sex</label><select value={data.sex} onChange={e => update('sex', e.target.value)} className="modal-select"><option value="Male">Male</option><option value="Female">Female</option></select></div>
            </div>
            <div className="edit-modal-row">
              <div className="edit-modal-field" style={{ width: 160 }}><label>Date of Birth</label><input type="date" value={data.dob || ''} onChange={e => update('dob', e.target.value)} /></div>
              <div className="edit-modal-field" style={{ width: 150 }}><label>Marital Status</label><select value={data.maritalStatus || ''} onChange={e => update('maritalStatus', e.target.value)} className="modal-select"><option value="">-</option><option value="Single">Single</option><option value="Married">Married</option><option value="Divorced">Divorced</option></select></div>
            </div>
            <div className="edit-modal-row">
              <div className="edit-modal-field" style={{ flex: 1 }}><label>License #</label><input type="text" value={data.licNum} onChange={e => update('licNum', e.target.value)} /></div>
              <div className="edit-modal-field" style={{ width: 80 }}><label>State</label><input type="text" value={data.stateLic} onChange={e => update('stateLic', e.target.value)} /></div>
              <div className="edit-modal-field" style={{ width: 100 }}><label>Experience</label><input type="text" value={data.yrsExp} onChange={e => update('yrsExp', e.target.value)} /></div>
            </div>
            <div className="edit-modal-row">
              <div className="edit-modal-field" style={{ width: 140 }}><label>Date Hired</label><input type="text" value={data.dateHired} onChange={e => update('dateHired', e.target.value)} /></div>
              <div className="edit-modal-field" style={{ width: 140 }}><label>Yr LIC (issued)</label><input type="text" value={data.licYear || ''} onChange={e => update('licYear', e.target.value)} placeholder="e.g. 2028" /></div>
              <div className="edit-modal-field" style={{ flex: 1 }}><label>Address</label><input type="text" value={data.address} onChange={e => update('address', e.target.value)} /></div>
            </div>
          </div>
        </div>
        <div className="edit-modal-footer"><button className="btn-cancel" onClick={onClose}>CANCEL</button><button className="btn-add-submit" onClick={() => onSave(data)}>SAVE</button></div>
      </div>
    </div>
  );
}

function CoverageCell({ coverages }) {
  const [expanded, setExpanded] = React.useState(false);
  if (!coverages.length) return <span>-</span>;
  const preview = coverages.slice(0, 2).join(', ');
  const hasMore = coverages.length > 2;
  if (expanded) {
    return (
      <span>
        {coverages.join(', ')}
        <span className="ca-grid-see-more" onClick={() => setExpanded(false)}> Show less</span>
      </span>
    );
  }
  return (
    <span>
      {preview}
      {hasMore && <span className="ca-grid-see-more" onClick={() => setExpanded(true)}> ...See more</span>}
    </span>
  );
}

function FilterDropdown({ label, value, options, labels, onChange }) {
  const [open, setOpen] = React.useState(false);
  const ref = React.useRef(null);

  React.useEffect(() => {
    function handleClick(e) {
      if (ref.current && !ref.current.contains(e.target)) setOpen(false);
    }
    document.addEventListener('mousedown', handleClick);
    return () => document.removeEventListener('mousedown', handleClick);
  }, []);

  const displayLabels = labels || options;

  return (
    <div className="sidebar-filter" ref={ref} onClick={() => setOpen(!open)}>
      <span className="sidebar-filter-label">{label}</span>
      <span className="sidebar-filter-value">{value ? (labels ? displayLabels[options.indexOf(value)] : value) : 'Any'}</span>
      <span className="sidebar-filter-arrow">▾</span>
      {open && (
        <div className="sidebar-filter-menu">
          <div className="sidebar-filter-option" onClick={(e) => { e.stopPropagation(); onChange(''); setOpen(false); }}><em>Any</em></div>
          {options.map((opt, i) => (
            <div
              key={opt}
              className={`sidebar-filter-option${opt === value ? ' active' : ''}`}
              onClick={(e) => { e.stopPropagation(); onChange(opt); setOpen(false); }}
            >
              {displayLabels[i]}
            </div>
          ))}
        </div>
      )}
    </div>
  );
}
