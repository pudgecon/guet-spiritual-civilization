module Admin
  class ArticlesController < ApplicationController
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
    end

    def destroy
    end

    def resource_params
      params.require(:article).permit :id, :title, :author
    end
  end
end
