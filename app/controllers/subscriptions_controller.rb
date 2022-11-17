class SubscriptionsController < ApplicationController

	skip_before_action :verify_authenticity_token

	def create
		debugger
		@subscribtion = SubscribtionPlan.find_by(id: params["subscribtion_plan_id"])
	  @subscription = current_user.subscriptions.find_or_create_by(amount: @subscribtion.amount, subscribtion_plan_id: @subscribtion.id) 
	     redirect_to pay_subscriptions_path(subscription_id: @subscription.id)
	end

	def pay
		@subscription = current_user.subscriptions.find_by(id: params[:subscription_id])
	end

	def update_subcription
		payment_response = {
        razorpay_order_id: params[:razorpay_payment_id],
        razorpay_payment_id: params[:razorpay_subscription_id],
        razorpay_signature: params[:razorpay_signature]
      }
    verify_signature = Razorpay::Utility.verify_payment_signature(payment_response)
		@subscription = current_user.subscriptions.find_by(razorpay_subscription_id: params[:razorpay_subscription_id])
		
		@plan_type =  @subscription.subscribtion_plan.plan_type
		 
		 if @plan_type == "weekly"
		 	  end_date = DateTime.now + 7.days

		 	elsif @plan_type =="monthly"
		 		end_date = DateTime.now + 30.days

		 	elsif @plan_type == "yearly"
		 		end_date = DateTime.now + 365.days
		 	end

	  if verify_signature && @subscription.present?
	    @update_subcription = @subscription.update(razorpay_payment_id: params[:razorpay_payment_id], end_time: end_date)
         redirect_to welcome_index_path 
	  else
      redirect_to pay_subscriptions_path(subscription_id: @subscription.id)
    end

	end
end
