App.Article = DS.Model.extend
  title:  DS.attr 'string'
  author: DS.attr 'string'

  createdAt: DS.attr 'string'
  updatedAt: DS.attr 'string'

  articleNodes: DS.hasMany 'articleNode', async: true

  text: (->
    @get('articleNodes').mapProperty('nodeText').join('\r\n')
  ).property(
    'articleNodes.@each.nodeType',
    'articleNodes.@each.nodeText',
    'articleNodes.@each.order'
  )
