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
//= require_self
// Loads all Bootstrap javascripts
//= require bootstrap
//= require_tree .

jQuery(document).ready(function($){
    $("#container7").hide();
    $("#container2").hide();
    $("#container3").hide();
    $("#container4").hide();
    $("#container5").hide();
    $("#container6").hide();
    var $collapsables = $('.collapsable-section');
    $collapsables.each(function(i){
        var $label = $(this).find('.label').filter(':first');
        var $fields = $(this).find('.field').filter('.field');
        $label.click(function(e){
            $fields.slideToggle(200);
        });
    });
});