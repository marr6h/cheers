require 'test_helper'

class UserTest < ActiveSupport::TestCase
    test 'user aggregates 0 posts' do
        user = users(:john)
        other_user = users(:paul)
        user.follow(other_user)
        posts = user.aggregate_post
        assert_equal posts.length, 0
    end

end
