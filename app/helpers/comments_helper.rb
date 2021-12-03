module CommentsHelper
    def cache_key_for_comment_list
	    return "comments/#{params[:page]}/#{Comment.maximum(:id)}"
	end

    def cache_key_for_individual_comment(comment)
        return "comments/tweet_#{comment.tweet_id}/user_#{comment.user_id}"
    end
end