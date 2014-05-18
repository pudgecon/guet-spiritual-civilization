class CreateArticleNodes < ActiveRecord::Migration
  def change
    create_table :article_nodes do |t|
      t.string :node_type
      t.text :node_text
      t.integer :order
      t.references :article, index: true

      t.timestamps
    end
  end
end
