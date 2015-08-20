FactoryGirl.define do 
	factory :product do
		name "product"
		price 10
		count 1
    	category_id { Category.where(name: 'MyCategory').pluck(:category_id) }
	end	
end