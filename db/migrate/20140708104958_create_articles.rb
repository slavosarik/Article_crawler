class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :id_article
      t.string :title
      t.text :perex

      t.timestamps
    end
  end
end
