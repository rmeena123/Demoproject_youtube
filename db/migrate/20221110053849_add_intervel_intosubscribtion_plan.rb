class AddIntervelIntosubscribtionPlan < ActiveRecord::Migration[6.0]
  def change
   add_column :subscribtion_plans, :interval, :integer 
  end

end
