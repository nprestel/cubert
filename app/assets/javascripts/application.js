// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require rails.validations
//= require rails.validations.simple_form
//= require bootstrap-alert
//= require_self
// Loads all Bootstrap javascripts
//= require bootstrap
//= require_tree .

window.onload = function () {
  var L1 = document.getElementById('L1'),
      W1 = document.getElementById('W1'),
      H1 = document.getElementById('H1'),
      L2 = document.getElementById('L2'),
      W2 = document.getElementById('W2'),
      H2 = document.getElementById('H2'),
      L3 = document.getElementById('L3'),
      W3 = document.getElementById('W3'),
      H3 = document.getElementById('H3'),
      Vol = document.getElementById('Vol');

  H1.onkeyup = function () { // or first.onchange
    Vol.value = ((L1.value * W1.value * H1.value)/1728) + ((L2.value * W2.value * H2.value)/1728) + ((L3.value * W3.value * H3.value)/1728);
  };
  H2.onkeyup = function () { // or first.onchange
    Vol.value = ((L1.value * W1.value * H1.value)/1728) + ((L2.value * W2.value * H2.value)/1728) + ((L3.value * W3.value * H3.value)/1728);
  };
  H3.onkeyup = function () { // or first.onchange
    Vol.value = ((L1.value * W1.value * H1.value)/1728) + ((L2.value * W2.value * H2.value)/1728) + ((L3.value * W3.value * H3.value)/1728);
  };
};