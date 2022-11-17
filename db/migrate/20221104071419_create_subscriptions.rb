class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.float :amount
      t.string :razorpay_subscription_id
      t.string :razorpay_payment_id
      t.integer :user_id

      t.timestamps
    end
  end
end
