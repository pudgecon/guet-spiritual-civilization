Rails.application.routes.draw do

  root 'home#index'
  get 'home/index'

  namespace "admin" do
    root 'home#index'
    resources 'articles', only: [:index, :show, :create, :update, :destroy]
    resources 'article_nodes', only: [:index, :show, :create, :update, :destroy]
    resources 'images', only: [:create]
  end
end
