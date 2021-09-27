class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.string :text
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
