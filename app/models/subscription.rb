class Subscription < ApplicationRecord
	belongs_to :user
	belongs_to :subscribtion_plan

	before_save :create_subscription

	def create_subscription
	  razorpay = Payment::RazorpayPlan.new
	  subscription = razorpay.create_subscription(self)
	  self.razorpay_subscription_id = subscription
	end
end
