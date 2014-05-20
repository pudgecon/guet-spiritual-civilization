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
      @get('content.content').save()
    edit: ->
      @set('editing', true)
