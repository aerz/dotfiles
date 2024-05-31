// ==UserScript==
// @name Simple scrollbar
// @match *://*/*
// @run-at document-end
// ==/UserScript==

var scrl = document.createElement('style');

scrl.textContent = `
/* width */
::-webkit-scrollbar {
  width: 10px;
}

/* Track */
::-webkit-scrollbar-track {
  background: transparent;
}

/* Handle */
::-webkit-scrollbar-thumb {
  background: #888;
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: #555;
}
`;

document.head.appendChild(scrl);
