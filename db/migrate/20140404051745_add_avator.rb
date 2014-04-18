class AddAvator < ActiveRecord::Migration
  def change
  	add_column :users, :avatar, :string, default: '/demo/avatar.jpg'
  end
end
