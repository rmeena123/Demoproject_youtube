ActiveAdmin.register SubscribtionPlan do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :plan_type, :name, :amount, :razorpay_plan_id, :interval
  #
  # or
  #
  # permit_params do
  #   permitted = [:plan_type, :name, :amount, :razorpay_plan_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

   form do |f|
    f.inputs do 
      f.input :plan_type, :prompt => 'Plan type' 
      f.input :name
      f.input :amount
      f.input :interval
    end
      f.actions
  end
  
end
