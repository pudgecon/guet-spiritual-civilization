#= require jquery
#= require jquery_ujs
#= require showdown
#= require notifier
#= require bootstrap
#= require handlebars
#= require ember
#= require ember-data
#= require_self
#= require ./app

window.App = Ember.Application.create
  LOG_TRANSITIONS: true
  LOG_TRANSITIONS_INTERNAL: true
  LOG_ACTIVE_GENERATION: true
