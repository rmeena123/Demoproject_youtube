class ChangeDataTypeForRazorpayPlanId < ActiveRecord::Migration[6.0]

    def up
        change_column :subscribtion_plans, :razorpay_plan_id, :string
    end

    def down
        change_column :subscribtion_plans, :razorpay_plan_id, :integer
    end
    
end
