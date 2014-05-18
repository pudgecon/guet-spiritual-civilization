App.ArticleNode = DS.Model.extend
  nodeType: DS.attr 'string'
  nodeText: DS.attr 'string'

  order:    DS.attr 'number'

  article:  DS.belongsTo 'article'
