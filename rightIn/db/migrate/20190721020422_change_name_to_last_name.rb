class ChangeNameToLastName < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :name, :last_name
  end
end
