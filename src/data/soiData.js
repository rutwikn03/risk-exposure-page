const set1 = [
  { subject: 'Building', amount: '$2,500,000', coins: '90%', valuation: 'Replacement Cost', cause: 'Special Excluding Theft', inflation: '300', ded: '500', blkt: 'ASI12', forms: 'Special Property Coverage Form with Protective Safeguards endorsement.' },
  { subject: 'Business Personal Property', amount: '$650,000', coins: '80%', valuation: 'Actual Cash Value', cause: 'Broad', inflation: '250', ded: '250', blkt: 'BPP08', forms: 'Business Personal Property coverage subject to inventory reporting requirements.' },
  { subject: 'Business Income with Extra Expense', amount: '$900,000', coins: '100%', valuation: 'Agreed Amount', cause: 'Special Excluding Theft', inflation: '200', ded: '500', blkt: 'BIE21', forms: 'Coverage applies during the period of restoration only.' },
  { subject: 'Furniture & Fixtures', amount: '$180,000', coins: '90%', valuation: 'Replacement Cost', cause: 'Basic', inflation: '150', ded: '100', blkt: 'FF14', forms: 'Replacement limited to like-kind quality and condition.' },
];

const set2 = [
  { subject: 'Building', amount: '$4,800,000', coins: '100%', valuation: 'Replacement Cost', cause: 'Earthquake', inflation: '350', ded: '750', blkt: 'EQ45', forms: 'Earthquake endorsement applies with separate occurrence deductible.' },
  { subject: 'Machinery Equipment', amount: '$1,250,000', coins: '90%', valuation: 'Actual Cash Value', cause: 'Broad', inflation: '275', ded: '500', blkt: 'ME77', forms: 'Equipment breakdown excluded unless endorsed separately.' },
  { subject: 'Personal Property', amount: '$325,000', coins: '80%', valuation: 'Market Value', cause: 'Basic', inflation: '125', ded: '250', blkt: 'PP19', forms: 'Personal property coverage excludes employee-owned items.' },
  { subject: 'Extra Expense', amount: '$500,000', coins: '100%', valuation: 'Agreed Amount', cause: 'Special Excluding Theft', inflation: '200', ded: '300', blkt: 'EE31', forms: 'Expense must directly reduce the suspension of operations.' },
  { subject: 'Furniture & Fixtures', amount: '$240,000', coins: '90%', valuation: 'Replacement Cost', cause: 'Broad', inflation: '180', ded: '250', blkt: 'FF62', forms: 'Subject to replacement within a reasonable period after loss.' },
];

const set3 = [
  { subject: 'Business Personal Property', amount: '$950,000', coins: '90%', valuation: 'Replacement Cost', cause: 'Special Excluding Theft', inflation: '300', ded: '500', blkt: 'BP91', forms: 'Stock valuation based on replacement cost at time of loss.' },
  { subject: 'Machinery Equipment', amount: '$1,800,000', coins: '100%', valuation: 'Agreed Amount', cause: 'Earthquake', inflation: '400', ded: '900', blkt: 'MQ24', forms: 'Coverage subject to scheduled equipment list.' },
  { subject: 'Business Income with Extra Expense', amount: '$1,400,000', coins: '100%', valuation: 'Agreed Amount', cause: 'Broad', inflation: '250', ded: '500', blkt: 'BI56', forms: 'Actual loss sustained during the restoration period.' },
  { subject: 'Personal Property', amount: '$420,000', coins: '80%', valuation: 'Actual Cash Value', cause: 'Basic', inflation: '175', ded: '200', blkt: 'PR88', forms: 'Coverage excludes property in transit unless endorsed.' },
  { subject: 'Extra Expense', amount: '$375,000', coins: '90%', valuation: 'Market Value', cause: 'Broad', inflation: '220', ded: '300', blkt: 'EX43', forms: 'Expenses must be necessary and documented.' },
  { subject: 'Building', amount: '$6,200,000', coins: '100%', valuation: 'Replacement Cost', cause: 'Special Excluding Theft', inflation: '350', ded: '750', blkt: 'BL15', forms: 'Ordinance or law coverage available by endorsement.' },
];

const set4 = [
  { subject: 'Furniture & Fixtures', amount: '$275,000', coins: '80%', valuation: 'Market Value', cause: 'Basic', inflation: '125', ded: '150', blkt: 'FX28', forms: 'Coverage limited to insured premises listed in the policy.' },
  { subject: 'Building', amount: '$3,750,000', coins: '90%', valuation: 'Replacement Cost', cause: 'Broad', inflation: '275', ded: '500', blkt: 'BD63', forms: 'Vacancy clause applies if building is vacant over 60 days.' },
  { subject: 'Personal Property', amount: '$560,000', coins: '90%', valuation: 'Actual Cash Value', cause: 'Special Excluding Theft', inflation: '225', ded: '250', blkt: 'PP52', forms: 'Electronic records limited to policy sublimits.' },
  { subject: 'Machinery Equipment', amount: '$2,150,000', coins: '100%', valuation: 'Replacement Cost', cause: 'Earthquake', inflation: '375', ded: '800', blkt: 'MC07', forms: 'Equipment must be maintained according to manufacturer guidelines.' },
  { subject: 'Business Personal Property', amount: '$780,000', coins: '80%', valuation: 'Agreed Amount', cause: 'Broad', inflation: '200', ded: '300', blkt: 'BP34', forms: 'Newly acquired property covered for up to 30 days.' },
  { subject: 'Extra Expense', amount: '$650,000', coins: '100%', valuation: 'Market Value', cause: 'Special Excluding Theft', inflation: '250', ded: '500', blkt: 'EE90', forms: 'Coverage applies only to reasonable and necessary expenses.' },
  { subject: 'Business Income with Extra Expense', amount: '$1,950,000', coins: '100%', valuation: 'Agreed Amount', cause: 'Broad', inflation: '300', ded: '750', blkt: 'BI72', forms: 'Business interruption begins after the applicable waiting period.' },
];

const set5 = [
  { subject: 'Building', amount: '$2,500,000', coins: '90%', valuation: 'Replacement Cost', cause: 'Special Excluding Theft', inflation: '300', ded: '500', blkt: 'ASI12', forms: 'Special Property Coverage Form with Protective Safeguards endorsement.' },
  { subject: 'Business Personal Property', amount: '$650,000', coins: '80%', valuation: 'Actual Cash Value', cause: 'Broad', inflation: '250', ded: '250', blkt: 'BPP08', forms: 'Business Personal Property coverage subject to inventory reporting requirements.' },
  { subject: 'Business Income with Extra Expense', amount: '$900,000', coins: '100%', valuation: 'Agreed Amount', cause: 'Special Excluding Theft', inflation: '200', ded: '500', blkt: 'BIE21', forms: 'Coverage applies during the period of restoration only.' },
  { subject: 'Furniture & Fixtures', amount: '$180,000', coins: '90%', valuation: 'Replacement Cost', cause: 'Basic', inflation: '150', ded: '100', blkt: 'FF14', forms: 'Replacement limited to like-kind quality and condition.' },
];

const sets = [set1, set2, set3, set4, set5];

const soiData = {
  'Location 1 Building 1': set1,
  'Location 1 Building 2': set2,
  'Location 1 Building 3': set3,
  'Location 2 Building 1': set4,
  'Location 2 Building 2': set5,
  'Location 2 Building 3': set2,
  'Location 2 Building 4': set3,
  'Location 2 Building 5': set1,
  'Location 3 Building 1': set4,
  'Location 3 Building 2': set5,
  'Location 4 Building 1': set2,
  'Location 4 Building 2': set3,
  'Location 4 Building 3': set1,
  'Location 5 Building 1': set4,
  'Location 5 Building 2': set5,
  'Location 6 Building 1': set3,
  'Location 6 Building 2': set2,
  'Location 6 Building 3': set1,
  'Location 6 Building 4': set4,
  'Location 7 Building 1': set5,
  'Location 8 Building 1': set2,
  'Location 8 Building 2': set3,
  'Location 9 Building 1': set4,
  'Location 9 Building 2': set1,
  'Location 9 Building 3': set5,
  'Location 10 Building 1': set2,
  'Location 11 Building 1': set3,
  'Location 11 Building 2': set4,
  'Location 11 Building 3': set1,
  'Location 11 Building 4': set5,
  'Location 12 Building 1': set2,
  'Location 13 Building 1': set3,
  'Location 13 Building 2': set4,
  'Location 14 Building 1': set1,
  'Location 14 Building 2': set5,
  'Location 14 Building 3': set2,
  'Location 15 Building 1': set3,
  'Location 16 Building 1': set4,
  'Location 16 Building 2': set1,
  'Location 17 Building 1': set5,
};

export default soiData;
