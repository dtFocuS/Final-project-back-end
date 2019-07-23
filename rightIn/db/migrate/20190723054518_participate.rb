class Participate < ActiveRecord::Migration[5.2]
  def change
    create_table :participates do |t|
      t.integer :activity_id
      t.integer :user_id

      t.timestamps
    end
  end
end
