App.MenuBarComponent = Ember.Component.extend
  classNames: ['menu-bar']

  menus: [
    { router: 'articles', icon: 'fa fa-list' }
    { router: 'settings', icon: 'fa fa-gears' }
    { devide: true }
    { router: 'settings', icon: 'fa fa-gears' }
  ]
