class ChangeParticipatesToParticipations < ActiveRecord::Migration[5.2]
  def change
    rename_table :participates, :participations
  end
end
