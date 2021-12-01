module UsersHelper
	def cache_key_for_user_sign_in
		return "users/sign_in"
	end

	def cache_key_for_user(u)
		return "users/#{u.id}"
	end
end
