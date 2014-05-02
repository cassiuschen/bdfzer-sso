class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.integer :origin_user_id
      t.integer :kind
      t.text :origin_body
      t.text :body
      t.references :user, index: true

      t.timestamps
    end
  end
end
