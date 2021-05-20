class AddColumnsToPosts < ActiveRecord::Migration[6.1]
  def change
    t.datetime :created_at
    t.string :image_url
  
  end
end
