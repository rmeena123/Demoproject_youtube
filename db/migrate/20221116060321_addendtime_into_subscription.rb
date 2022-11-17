class AddendtimeIntoSubscription < ActiveRecord::Migration[6.0]
  def change
     add_column :subscriptions, :end_time, :datetime
  end
end
