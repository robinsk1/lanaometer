class SiteController < ApplicationController
 require 'sentiment'

 def welcome
  #Get search term from user
  #print "Enter search term: "
  search_term = "lana del rey"
  #Get the hash from twitter using the specified search term
  #puts "Accessing tweets using search term: #{search_term}..."
  senti = Sentiment.new
  result = senti.get_tweet_hash( search_term, 100)
  negative = 0
  neutral = 0
  positive = 0

  for tweet in result do
    #  puts "From #{tweet['from_user']}: #{tweet['text']}"
    sentiment = senti.analyze_sentiment( tweet['text'] )
    if sentiment == 0
      negative += 1
    elsif sentiment == 1
      neutral += 1
    elsif sentiment == 2
      positive += 1
    end
  end

  @results = result
  @tweets =  "Number of tweets analyzed: #{result.size}"
  @negatweets =  "Negative tweets: #{negative}"
  @neutweets =  "Neutral tweets: #{neutral}"
  @positweets = "Positive tweets: #{positive}"

  if positive >= negative
    @pos = "Search term \"#{search_term}\" had a #{((100.0 * positive) / (positive+negative)).round(0)}\% positive sentiment."
  else
    @neg = "Search term \"#{search_term}\" had a #{((100.0 * negative) / (positive+negative)).round(0)}\% negative sentiment."
  end

 end

end
