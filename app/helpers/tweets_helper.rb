module TweetsHelper
    def cache_key_for_tweet(t)
		return "tweets/#{t.id}"
	end
	def cache_key_for_tweet_list
		return "tweets/#{params[:page]}/#{Tweet.maximum(:id)}"
	end
	def cache_key_for_user_tweets(u)
		return "user/tweets/#{u.id}/#{params[:page]}/#{u.tweets.count}"
	end
end