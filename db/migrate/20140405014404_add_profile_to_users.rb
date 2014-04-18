class AddProfileToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :grade, :string
  	add_column :users, :sex, :string
  	add_column :users, :phone, :string
  	add_column :users, :contact, :hstore
  	add_column :users, :role, :integer, default: 0
  	add_column :users, :description, :text
  	add_column :users, :tag, :hstore
  	add_column :users, :unit, :integer, default: 0
  end
end
