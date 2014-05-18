App.ArticlesArticleController = Ember.ObjectController.extend
  previewHtml: (->
    return if Ember.isNone(@get('text'))

    new Handlebars.SafeString(
      new Showdown.converter().makeHtml(@get('text'))
    )
  ).property('model.text')

  actions:
    save: ->
      @get('model').save().then =>
        @transitionToRoute 'articles.article', @get('model')

    addArticleNode: (type) ->
      @get('model.articleNodes').addObject @get('store').createRecord 'articleNode',
        nodeType: type
        article: @get('model')
