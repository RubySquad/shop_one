class UsersController < ApplicationController

	def login
		puts 'Showing LogIn form'
		render "authorization"
	end

	def authorize

		user = find_user_by_login(params[:email])
		if !user.nil? && check_user_password(user, params[:password])
			grant_access(user)
		else
			deny_access
		end

	end

private

	def find_user_by_login(login)
		User.where(email: login).first
	end

	def check_user_password(user, password)
		password === user[:password]
	end

	def grant_access(user)
		render text: "Acces granted - #{user[:name]} #{user[:surname]}"
	end

	def deny_access
		render text: "No such user or wrong password"
	end
end
