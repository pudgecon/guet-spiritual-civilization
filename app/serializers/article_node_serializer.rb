class ArticleNodeSerializer < ActiveModel::Serializer
  attributes :id, :node_type, :node_text, :order, :article_id
end
