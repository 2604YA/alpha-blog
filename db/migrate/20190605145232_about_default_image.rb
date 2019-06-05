class AboutDefaultImage < ActiveRecord::Migration[5.1]
  def change
      remove_column :users, :image_name, :string
      
      add_column :users, :image_name, :string, default: 'default_image.png'
  end
end
