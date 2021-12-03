module MessagesHelper
  def cache_key_for_user_messages_page(u1, u2)
		return "user/messages/#{u1.id}/#{u2.id}/#{params[:page]}/#{Message.maximum(:id)}"
	end

  def cache_key_for_user_conversations_page(u)
		return "user/messages/#{u.id}/#{params[:page]}/#{Message.maximum(:id)}"
	end

end
