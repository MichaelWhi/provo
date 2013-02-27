module TwitterHelper
  include TweetButton
  TweetButton.default_tweet_button_options = {text: "Check out this cool idea on Provo! #upb"}

  def tweet_this(obj)
    more_params = (obj.user.twitter.blank? ? {} : {via: obj.user.twitter})
    if obj.is_a? Project
      url = project_url obj
    elsif obj.is_a? Idea
      url = idea_url obj
    else
      url = root_url
    end
    custom_tweet_button("Tweet!", {text: "Check out #{truncate(obj.title, length: 40)} (#{url}) at ProVo! #upb"}.merge(more_params), {class: 'no-print', data: {popup: true}})
  end
end