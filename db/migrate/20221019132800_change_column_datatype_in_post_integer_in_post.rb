class ChangeColumnDatatypeInPostIntegerInPost < ActiveRecord::Migration[6.0]
  def change
      change_column :posts, :post_type, :integer
  end
end
