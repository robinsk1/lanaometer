class SiteController < ApplicationController
 require 'sentiment'

 def welcome
  search_term = "lana del rey"
  @articles = GuardianContent::Content.search(search_term)
  senti = Sentiment.new
  @results = senti.get_tweet_hash( search_term, 100)
  negative, neutral, positive = 0, 0, 0
  for tweet in @results do
    sentiment = senti.analyze_sentiment( tweet['text'] )
    if sentiment == 0
      negative += 1
    elsif sentiment == 1
      neutral += 1
    elsif sentiment == 2
      positive += 1
    end
  end
  @tweets =  "Number of tweets analyzed: #{@results.size}"
  @negatweets, @neutweets, @positweets =  "Negative tweets: #{negative}",  "Neutral tweets: #{neutral}", "Positive tweets: #{positive}"
  if positive >= negative
    @resolution = "\"#{search_term}\" had a #{((100.0 * positive) / (positive+negative)).round(0)}\% positive sentiment."
  else
    @resolution = "\"#{search_term}\" had a #{((100.0 * negative) / (positive+negative)).round(0)}\% negative sentiment."
  end
 end

end
