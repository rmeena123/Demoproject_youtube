 module Payment
  require "razorpay"

    class RazorpayPlan 
      def create_plan(plan)
       ::Razorpay.setup('rzp_test_wrYixxsZmgVEj5', 'BZv1rukXURb10VLLX39XfHuk')
        para_attr = {
           "period": plan.plan_type,  
            "interval": plan.interval,
              "item": {
                 "name": plan.name,
                 "amount": plan.amount.to_i*100,
                  "currency": "INR"
                 }       
        }
        razorpay_plan = Razorpay::Plan.create(para_attr)
        plan.razorpay_plan_id = razorpay_plan.id
       # store_plan_id(plan)        
      end

      def create_subscription(subscription)
        ::Razorpay.setup('rzp_test_wrYixxsZmgVEj5', 'BZv1rukXURb10VLLX39XfHuk')
        para_attr = {
          "plan_id": subscription.subscribtion_plan.razorpay_plan_id,
          "total_count": 1,
           "addons": [
            {
              "item": {
               "name": "Rahul",
               "amount": subscription.amount.to_i,
               "currency": "INR"
            }
          }
         ]
        }
        razorpay_subscription = Razorpay::Subscription.create(para_attr)
        subscription.razorpay_subscription_id = razorpay_subscription.id
      end
    end
 end
