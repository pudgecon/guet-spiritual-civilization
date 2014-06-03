Ember.Handlebars.helper 'md-img-tag', (value) ->
  return null if Ember.isNone(value)

  new Handlebars.SafeString(
    new Showdown.converter().makeHtml(value)
  )
