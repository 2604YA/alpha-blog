class ChangeImageNameOnUsers < ActiveRecord::Migration[5.1]
  def change
      remove_column :users, :image_name, :string
      
      add_column :users, :image_name, :string, default: 'default_image.jpg'
  end
end
