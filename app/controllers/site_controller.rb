class SiteController < ApplicationController
 require 'sentiment'

 def welcome
  search_term = "lana del rey"
  #@articles = GuardianContent::Content.search(search_term)
  senti = Sentiment.new
  @results = senti.get_tweet_hash( search_term, 50)
  negative, neutral, positive = 0, 0, 0
  for tweet in @results do
    sentiment = senti.analyze_sentiment( tweet['text'] )
    if sentiment == 0
      negative += 1
      tweet.merge! :score => "negative"
    elsif sentiment == 1
      neutral += 1
      tweet.merge! :score => "neutral"
    elsif sentiment == 2
      positive += 1
      tweet.merge! :score => "positive"
    end
  end
  @tweets =  "Number of tweets analyzed: #{@results.size}"
  @negatweets, @neutweets, @positweets =  "'anti-lana' tweets: #{negative}",  "neutral tweets: #{neutral}", "'pro-lana' tweets: #{positive}"
  if positive >= negative
    @resolution = {:text => "#{((100.0 * positive) / (positive+negative)).round(0)}\%", :sentiment => :positive}
  else
    @resolution = {:text => "#{((100.0 * negative) / (positive+negative)).round(0)}\%", :sentiment => :positive}
  end
 end

end
