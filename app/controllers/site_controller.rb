class SiteController < ApplicationController
 require 'sentiment'

 def welcome
  search_term = "lana del rey"
  #@articles = GuardianContent::Content.search(search_term)
  senti = Sentiment.new
  @results = senti.get_tweet_hash( search_term, 100)
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
  @negatweets, @neutweets, @positweets =  "'sad-lana' tweets: #{negative}",  "neutral tweets: #{neutral}", "'happy-lana' tweets: #{positive}"
  if positive >= negative
    @verdict = "positive"
    @percentage = ((100.0 * negative) / (positive+negative)).round(0)
    @resolution = {:text => "#{@percentage}\%", :sentiment => :positive}
  else
    @verdict = "negative"
    @percentage = ((100.0 * positive) / (positive+negative)).round(0)
    @resolution = {:text => "#{@percentage}\%", :sentiment => :negative}
  end
 end

end
