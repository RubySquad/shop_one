FactoryGirl.define do 
	factory :user do
		name "name"
		surname "surname"
		sequence(:email) { |i| "email#{i}@email.com"}
		password "password"
		role "user"
	end	
end