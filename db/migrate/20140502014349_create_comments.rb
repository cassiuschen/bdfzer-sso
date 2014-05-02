class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :commenter_id
      t.text :body
      t.references :tweet, index: true
      t.references :share, index: true

      t.timestamps
    end
  end
end
