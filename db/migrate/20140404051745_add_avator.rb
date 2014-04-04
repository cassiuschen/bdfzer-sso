class AddAvator < ActiveRecord::Migration
  def change
  	add_column :user, :avatar, :string
  end
end
