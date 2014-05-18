App.ArticleNodesView = Ember.CollectionView.extend
  content: null

  itemViewClass: Ember.View.extend
    template: Ember.Handlebars.compile("the letter: ")

  emptyView: Ember.View.extend
    template: Ember.Handlebars.compile("还没有内容，点击“添加节”开始吧！")

Ember.Handlebars.registerHelper 'article-nodes', (options) ->
  Ember.Handlebars.helpers.collection.call @, 'App.ArticleNodesView', options
