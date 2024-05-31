// ==UserScript==
// @name        Full layout wowhead
// @description Fills the adblock gaps where ads would be
// @namespace   Violentmonkey Scripts
// @match       https://www.wowhead.com/*
// @grant       none
// @version     1.0
// ==/UserScript==

document.getElementsByClassName('page-content')[0].style["padding-right"] = '0px';
