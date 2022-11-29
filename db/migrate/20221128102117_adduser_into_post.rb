class AdduserIntoPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :admin_user_id, :integer

  end
end
