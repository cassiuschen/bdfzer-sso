class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.integer :provider, default: 0
      t.string :body
      t.references :user, index: true

      t.timestamps
    end
  end
end
