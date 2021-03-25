class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.text :content, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :baby_age_id, null: false
      t.integer :baby_gender_id, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
