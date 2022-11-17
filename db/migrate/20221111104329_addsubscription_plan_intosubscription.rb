class AddsubscriptionPlanIntosubscription < ActiveRecord::Migration[6.0]
  def change
        add_column :subscriptions, :subscribtion_plan_id, :integer
  end
end
