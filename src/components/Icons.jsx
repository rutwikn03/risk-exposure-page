import React from 'react';

// Red X (close/delete row)
export function CloseIcon({ size = 14, onClick, style }) {
  return (
    <img
      src="/close.svg"
      alt="Close"
      width={size}
      height={size}
      onClick={onClick}
      style={{ cursor: 'pointer', ...style }}
    />
  );
}

// Blue clone/duplicate icon
export function CloneIcon({ size = 14, onClick, style }) {
  return (
    <img
      src="/duplicate.svg"
      alt="Duplicate"
      width={size}
      height={size}
      onClick={onClick}
      style={{ cursor: 'pointer', ...style }}
    />
  );
}

// Hard hat icon (Construction Type)
export function HardHatIcon({ size = 36 }) {
  return (
    <img src="/construction details.svg" alt="Construction Type" width={size} height={size} />
  );
}

// House damage icon (Bld. Improvement Roofing)
export function HouseDamageIcon({ size = 36 }) {
  return (
    <img src="/building improvement roofing yr.svg" alt="Bld. Improvement Roofing Year" width={size} height={size} />
  );
}

// Tools icon (Year Built)
export function ToolsIcon({ size = 36 }) {
  return (
    <img src="/yr built.svg" alt="Year Built" width={size} height={size} />
  );
}

// Plus circle icon (ADD Subject of Insurance)
export function PlusCircleIcon({ size = 16 }) {
  return (
    <img src="/add subject of insurance.svg" alt="Add" width={size} height={size} />
  );
}

// Trash icon (DELETE PREMISE button)
export function TrashIcon({ size = 14 }) {
  return (
    <img src="/delete premise.svg" alt="Delete" width={size} height={size} style={{ display: 'inline-block' }} />
  );
}

// Reply/back arrow icon (RECENTS)
export function ReplyIcon({ size = 14 }) {
  return (
    <img src="/recents.svg" alt="Recents" width={size} height={size} />
  );
}
