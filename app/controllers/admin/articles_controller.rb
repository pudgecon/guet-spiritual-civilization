class Admin::ArticlesController < ApplicationController
  def index
    articles = Article.all

    render json: articles, each_serializer: ArticleSerializer, status: :ok
  end

  def show
    article = Article.find params[:id]

    render json: article, serializer: ArticleSerializer, status: :ok
  end

  def create
    article = Article.create! resource_params

    render json: article, serializer: ArticleSerializer, status: :created
  end

  def update
    article = Article.find params[:id]

    if article.update_attributes resource_params
      render json: article, serializer: ArticleSerializer, status: :ok
    else
      render json: { errors: article.errors }, status: :unprocess_entity
    end
  end

  def destroy
    article = Article.params[:id]

    if article.destroy
      head :ok
    else
      render json: { errors: article.errors }, status: :unprocess_entity
    end
  end

  def resource_params
    params.require(:article).permit :id, :title, :author
  end
end
