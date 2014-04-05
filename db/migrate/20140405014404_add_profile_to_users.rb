class AddProfileToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :grade, :string
  	add_column :users, :sex, :string
  	add_column :users, :phone, :string
  	add_column :users, :contact, :hstore
  	add_column :users, :role, :string,		default: "string"
  	add_column :users, :description, :text
  	add_column :users, :tag, :hstore
  end
end
