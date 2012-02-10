class SiteController < ApplicationController
 require 'sentiment'

 def welcome
  search_term = "lana del rey"
  #@articles = GuardianContent::Content.search(search_term)
  senti = Sentiment.new
  req_tweet_number = 50
  @results = senti.get_tweet_hash( search_term, req_tweet_number)
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

  @negatweets, @neutweets, @positweets =  "negative tweets: #{negative}",  "neutral tweets: #{neutral}", "positive tweets: #{positive}"

  if positive >= negative
    @verdict = "positive"
    @percentage = ((100.0 * negative) / (positive+negative)).round(0)
    @resolution = {:text => "#{@percentage}\%", :sentiment => :positive}
  else
    @verdict = "negative"
    @percentage = ((100.0 * positive) / (positive+negative)).round(0)
    @resolution = {:text => "#{@percentage}\%", :sentiment => :negative}
  end

   @entity = Entity.find_by_name("LDR")

   Entity.update_counters @entity.id , :impression_count => req_tweet_number, :positive_count => positive, :neutral_count => neutral, :negative_count => negative

 end

end
