App.ArticleNodeComponent = Ember.Component.extend
  content: null

  layoutName: (->
    "components/articles/nodes/#{@get('content.nodeType')}_form"
  ).property('content.nodeType')

  editing: false

  didInsertElement: ->
    @set('editing', true) if @get('content.isNew')

  actions:
    save: ->
      @set('editing', false)
      @get('content').save()

    edit: ->
      @set('editing', true)

    remove: ->
      node = @get('content')
      article = node.get('article')
      node.deleteRecord()
      # TODO(Pudgecon)
      # confirmation!
      node.save().then =>
        debugger
        article.get('articleNodes').removeObject node
        Notifier.success "删除成功！"
      , =>
        Notifier.error "删除失败！"

    imageSaved: (json) ->
      @set('content.nodeText', "![Alt text](#{json.image.path})")
      @send('save')
