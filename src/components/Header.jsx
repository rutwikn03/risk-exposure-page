import React from 'react';

export default function Header({ activePage }) {
  const isAuto = activePage === 'commercial-auto';
  return (
    <div className="header-section">
      <h1>{isAuto ? 'SUB9CA2B7F | Metro Fleet Services' : 'SUB7FBA3A6 | Regent Park Villas'}</h1>
      <span className="product-type">{isAuto ? 'Commercial Automobile' : 'Commercial Property'}</span>
    </div>
  );
}
