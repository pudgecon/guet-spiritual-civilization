class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :links

  def links
    {
      article_nodes: "/admin/article_nodes?article_id=#{object.id}"
    }
  end
end
