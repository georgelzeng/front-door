class AddUsesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :uses, :integer, :default => 0
  end
end
