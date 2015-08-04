class UsersController < ApplicationController

	def login

		user = find_user_by_login(params[:email])
		unless user.nil?
			acces_granted = check_user_password(user, params[:password])
			render text: "#{acces_granted} - #{user[:name]} #{user[:surname]}"
		else
			render text: "No such user"
		end

	end

private

	def find_user_by_login(login)
		User.where(email: login).first
	end

	def check_user_password(user, password)
		password === user[:password]
	end
end
