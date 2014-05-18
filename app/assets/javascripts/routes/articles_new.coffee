App.ArticlesNewRoute = Ember.Route.extend
  controllerName: 'articlesArticle'

  model: ->
    @get('store').createRecord('article')
