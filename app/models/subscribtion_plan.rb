class SubscribtionPlan < ApplicationRecord
	has_many  :subscriptions
    has_many  :users, through: :subscriptions

   validates :name, :plan_type, :amount, :interval, presence: true
   validate  :cheack_interval_greatar_or_not, if: -> {self.plan_type == 'daily'}
   validates  :plan_type,  uniqueness: true
   enum plan_type: [:weekly, :monthly, :yearly ]

	 after_validation :create_plan, 
		def create_plan
		  unless self.errors.any?
				razorpay = Payment::RazorpayPlan.new
				razorpay.create_plan(self)
		  end
		end	

		def cheack_interval_greatar_or_not
		  errors.add(:interval, "In daily plan can't be less then 7") if interval < 7
    end	
end
