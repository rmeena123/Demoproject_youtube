class AddDisableToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :disable, :boolean, default: true
  end
end
