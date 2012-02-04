class SiteController < ApplicationController
 require 'sentiment'

 def welcome
  search_term = "lana del rey"
  senti = Sentiment.new
  result = senti.get_tweet_hash( search_term, 100)
  negative = 0
  neutral = 0
  positive = 0
  for tweet in result do
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
    @resolution = "\"#{search_term}\" had a #{((100.0 * positive) / (positive+negative)).round(0)}\% positive sentiment."
  else
    @resolution = "\"#{search_term}\" had a #{((100.0 * negative) / (positive+negative)).round(0)}\% negative sentiment."
  end
 end
end
