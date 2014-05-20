class Admin::ArticleNodesController < ApplicationController
  def index
    article_nodes = ArticleNode.where article_id: params[:article_id]

    render json: article_nodes, each_serializer: ArticleNodeSerializer, status: :ok
  end

  def show
    article_node = ArticleNode.params[:id]

    if article_node
      render json: article_node, serializer: ArticleNodeSerializer, status: :created
    else
      head :no_found
    end
  end

  def create
    article_node = ArticleNode.create! resource_params

    render json: article_node, serializer: ArticleNodeSerializer, status: :created
  end

  def update
    article_node = ArticleNode.find params[:id]

    if article_node.update_attributes resource_params
      render json: article_node, serializer: ArticleNodeSerializer, status: :ok
    else
      render json: { errors: article_nodes.errors }, status: :unprocess_entity
    end
  end

  def destroy
    article_node = ArticleNode.params[:id]

    if article_node.destroy
      head :ok
    else
      render json: { errors: article_nodes.errors }, status: :unprocess_entity
    end
  end

  def resource_params
    params.require(:article_node).permit :id, :node_text, :node_type, :article_id
  end
end
