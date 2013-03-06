require 'discourse_plugin'

module ProperDiscourse
  class Plugin < DiscoursePlugin

    def setup
      listen_for(:before_create_post)
    end

    def before_create_post(post)
      # We need to clean up the post.
    end
  end
end