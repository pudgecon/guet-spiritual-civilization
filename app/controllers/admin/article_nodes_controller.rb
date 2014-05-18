class Admin::ArticleNodesController < ApplicationController
  def index
    article_nodes = ArticleNode.where article_id: params[:article_id]

    render json: article_nodes, each_serializer: ArticleNodeSerializer, status: :ok
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end
end
