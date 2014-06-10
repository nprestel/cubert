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
  
  L1.onkeyup = function () {
      VolCalc = ((L1.value * W1.value * H1.value)/1728) + ((L2.value * W2.value * H2.value)/1728) + ((L3.value * W3.value * H3.value)/1728);
      if(VolCalc <= 0){Vol.value = ""}
      else{Vol.value = VolCalc;}};
  W1.onkeyup = function () {
      VolCalc = ((L1.value * W1.value * H1.value)/1728) + ((L2.value * W2.value * H2.value)/1728) + ((L3.value * W3.value * H3.value)/1728);
      if(VolCalc <= 0){Vol.value = ""}
      else{Vol.value = VolCalc;}};
  H1.onkeyup = function () {
      VolCalc = ((L1.value * W1.value * H1.value)/1728) + ((L2.value * W2.value * H2.value)/1728) + ((L3.value * W3.value * H3.value)/1728);
      if(VolCalc <= 0){Vol.value = ""}
      else{Vol.value = VolCalc;}};
      
  L2.onkeyup = function () {
      VolCalc = ((L1.value * W1.value * H1.value)/1728) + ((L2.value * W2.value * H2.value)/1728) + ((L3.value * W3.value * H3.value)/1728);
      if(VolCalc <= 0){Vol.value = ""}
      else{Vol.value = VolCalc;}};
  W2.onkeyup = function () {
      VolCalc = ((L1.value * W1.value * H1.value)/1728) + ((L2.value * W2.value * H2.value)/1728) + ((L3.value * W3.value * H3.value)/1728);
      if(VolCalc <= 0){Vol.value = ""}
      else{Vol.value = VolCalc;}};
  H2.onkeyup = function () {
      VolCalc = ((L1.value * W1.value * H1.value)/1728) + ((L2.value * W2.value * H2.value)/1728) + ((L3.value * W3.value * H3.value)/1728);
      if(VolCalc <= 0){Vol.value = ""}
      else{Vol.value = VolCalc;}};

  L3.onkeyup = function () {
      VolCalc = ((L1.value * W1.value * H1.value)/1728) + ((L2.value * W2.value * H2.value)/1728) + ((L3.value * W3.value * H3.value)/1728);
      if(VolCalc <= 0){Vol.value = ""}
      else{Vol.value = VolCalc;}};
  W3.onkeyup = function () {
      VolCalc = ((L1.value * W1.value * H1.value)/1728) + ((L2.value * W2.value * H2.value)/1728) + ((L3.value * W3.value * H3.value)/1728);
      if(VolCalc <= 0){Vol.value = ""}
      else{Vol.value = VolCalc;}};
  H3.onkeyup = function () {
      VolCalc = ((L1.value * W1.value * H1.value)/1728) + ((L2.value * W2.value * H2.value)/1728) + ((L3.value * W3.value * H3.value)/1728);
      if(VolCalc <= 0){Vol.value = ""}
      else{Vol.value = VolCalc;}};

};

$(function () {
    $( '#table' ).searchable({
        striped: true,
        oddRow: { 'background-color': '#f5f5f5' },
        evenRow: { 'background-color': '#fff' },
        searchType: 'fuzzy'
    });
    
    $( '#searchable-container' ).searchable({
        searchField: '#container-search',
        selector: '.row',
        childSelector: '.col-xs-4',
        show: function( elem ) {
            elem.slideDown(100);
        },
        hide: function( elem ) {
            elem.slideUp( 100 );
        }
    });
});

/*! jQuery Searchable v1.0.0 by Stidges (http://twitter.com/stidges) | MIT */
!function(a){function b(b,c){this.$element=a(b),this.settings=a.extend({},d,c),this.init()}var c="searchable",d={selector:"tbody tr",childSelector:"td",searchField:"#search",striped:!1,oddRow:{},evenRow:{},hide:function(a){a.hide()},show:function(a){a.show()},searchType:"default"};b.prototype={init:function(){this.$searchElems=a(this.settings.selector,this.$element),this.$search=a(this.settings.searchField),this.matcherFunc=this.getMatcherFunction(this.settings.searchType),this.bindEvents(),this.updateStriping()},bindEvents:function(){var b=this;this.$search.on("change keyup",function(){b.search(a(this).val()),b.updateStriping()}),""!==this.$search.val()&&this.$search.trigger("change")},updateStriping:function(){var b=this,c=["oddRow","evenRow"],d=this.settings.selector+":visible";this.settings.striped&&a(d,this.$element).each(function(d,e){a(e).css(b.settings[c[d%2]])})},search:function(b){var c,d,e,f,g,h,i,j;if(0===a.trim(b).length)return this.$searchElems.css("display",""),void this.updateStriping();for(d=this.$searchElems.length,c=this.matcherFunc(b),i=0;d>i;i++){for(h=a(this.$searchElems[i]),e=h.find(this.settings.childSelector),f=e.length,g=!0,j=0;f>j;j++)if(c(a(e[j]).text())){g=!1;break}g===!0?this.settings.hide(h):this.settings.show(h)}},getMatcherFunction:function(a){return"fuzzy"===a?this.getFuzzyMatcher:"strict"===a?this.getStrictMatcher:this.getDefaultMatcher},getFuzzyMatcher:function(a){var b,c=a.split("").reduce(function(a,b){return a+"[^"+b+"]*"+b});return b=new RegExp(c,"gi"),function(a){return b.test(a)}},getStrictMatcher:function(b){return b=a.trim(b),function(a){return-1!==a.indexOf(b)}},getDefaultMatcher:function(b){return b=a.trim(b).toLowerCase(),function(a){return-1!==a.toLowerCase().indexOf(b)}}},a.fn[c]=function(d){return this.each(function(){a.data(this,"plugin_"+c)||a.data(this,"plugin_"+c,new b(this,d))})}}(jQuery,window,document);