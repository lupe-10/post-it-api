class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :contents
      t.string :title
      t.reference :user
      t.timestamps
    end
  end
end
