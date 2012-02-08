module SiteHelper

  def color_code(tweet)
    case tweet[:score]
      when "negative"
        haml_tag(:div, :class => 'tweet negative') do
         haml_tag(:p, tweet['text'])
        end
      when "positive"
        haml_tag(:div, :class => 'tweet positive') do
         haml_tag(:p, tweet['text'])
        end
      when "neutral"
        haml_tag(:div, :class => 'tweet neutral') do
         haml_tag(:p, tweet['text'])
        end
    end
  end

  def color_code_resolution(resolution)
    case resolution[:sentiment]
      when :negative
        haml_tag(:div, :class => 'resolution red') do
         haml_tag('p.center', "#{resolution[:text]} negative tweets")
        end
      when :positive
        haml_tag(:div, :class => 'resolution green') do
         haml_tag('p.center', "#{resolution[:text]} positive tweets")
        end
    end
  end

end



