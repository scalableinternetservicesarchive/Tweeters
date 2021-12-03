# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')
Tweet.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('tweets')

all_tweets = [
 "Take time to know yourself.",
 "A narrow focus brings big results.",
 "Show up fully.",
 "Dont make assumptions.",
 "Be patient and persistent.",
 "In order to get, you have to give.",
 "Luck comes from hard work.",
 "Be your best at all times.",
 "Dont try to impress everyone.",
 "Dont be afraid of being afraid.",
 "Listen to learn.",
 "Lifes good, but its not fair.",
 "No task is beneath you.",
 "You cant always get what you want.",
 "Dont make decisions when you are angry or ecstatic.",
 "Dont worry what other people think.",
 "Use adversity as an opportunity.",
 "Do what is right, not what is easy.",
 "Dreams remain dreams until you take action.",
 "Treat others the way you want to be treated.",
 "When you quit, you fail.",
 "Trust your instincts.",
 "Learn something new every day.",
 "Make what is valuable important.",
 "Believe in yourself."]

data_load = {users: 500, tweets_per_user: 11000}

no_of_batches = 5
tweet_batch_size =  data_load[:tweets_per_user] / no_of_batches

p tweet_batch_size

# ActiveRecord::Base.logger.level = 1

DT_NOW = DateTime.current
DT_NOW_STR = DT_NOW.strftime("%FT%T")

# cols = User.column_names
# delimited_cols = cols.map {|s|   "#{s}"  }
# sql = "INSERT INTO users (#{delimited_cols.join(',')}) VALUES "

PASSWORD = 'password'
# PASSWORD_HASH = User.digest(PASSWORD)
PASSWORD_HASH = 'password'
# user_ids = (1..data_load[:users]).to_a

tweets = []

for j in 1..data_load[:tweets_per_user] do
  new_tweet = {
      content:   all_tweets.sample,
      likes:     0,
      comments:  0,
      user_id: 1,
      created_at: DT_NOW,
      updated_at: DT_NOW
      }

  tweets.append(new_tweet.clone)
  # Tweet.create!(new_tweet)
end


# User.insert_all(users)
# Tweet.insert_all(tweets)

# puts "Tweets count : #{Tweet.count} " + DateTime.current.strftime(" on %A, %b. %-d at %-l:%M:%S")
# puts "Created #{User.count} users" + DateTime.current.strftime(" on %A, %b. %-d at %-l:%M:%S")
#
for i in 1..no_of_batches do
  Tweet.insert_all(tweets.slice((i-1)*tweet_batch_size, tweet_batch_size))

  puts "Tweets count : #{Tweet.count} " + DateTime.current.strftime(" on %A, %b. %-d at %-l:%M:%S")

end
