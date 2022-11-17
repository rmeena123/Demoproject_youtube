class CreateSubscribtionPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :subscribtion_plans do |t|
      t.integer :plan_type
      t.string :name
      t.float :amount
      t.integer :razorpay_plan_id

      t.timestamps
    end
  end
end
