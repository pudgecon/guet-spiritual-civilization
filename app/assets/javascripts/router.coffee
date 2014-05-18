App.Router.map ()->
  @resource 'articles', ->
    @route 'new'
    @route 'article', path: ':article_id'

  @resource 'settings'

