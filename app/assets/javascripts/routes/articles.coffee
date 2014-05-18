App.ArticlesRoute = Ember.Route.extend
  model: ->
    @get('store').find('article')
