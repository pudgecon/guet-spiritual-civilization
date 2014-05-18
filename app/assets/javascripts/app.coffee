#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./helpers
#= require_tree ./components
#= require_tree ./templates
#= require_tree ./routes
#= require ./router
#= require_self

App.ApplicationAdapter = DS.ActiveModelAdapter.extend
  namespace: 'admin'

App.ApplicationSerializer = DS.ActiveModelSerializer.extend()
