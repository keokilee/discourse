require 'discourse_plugin'
require 'bomberman'

module ProperDiscourse
  class Plugin < DiscoursePlugin

    def setup
      listen_for(:before_create_post)
    end

    def before_create_post(post)
      if Bomberman::Profanity.profane?(post.raw)
        post.raw = Bomberman::Profanity.censor(post.raw, "REDACTED")
        post.cooked = post.cook(post.raw, topic_id: post.topic_id)
      end

      if Bomberman::Profanity.profane?(post.topic.title)
        topic = post.topic
        topic.title = Bomberman::Profanity.censor(topic.title, "REDACTED")
        topic.save
      end
    end
  end
end