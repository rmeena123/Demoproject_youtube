class AddadminUserIntoroles < ActiveRecord::Migration[6.0]
  def change
            add_column :admin_users, :role, :integer

  end
end
