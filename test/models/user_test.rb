require 'test_helper'

class UserTest < ActiveSupport::TestCase
    test 'user aggregates 0 posts' do
        user = users(:john)
        other_user = users(:paul)
        user.follow(other_user)
        posts = user.aggregate_post
        assert_equal posts.length, 0
    end

    test 'user aggregates 1 posts' do
        user = users(:john)
        other_user = users(:paul)
        user.follow(other_user)
        post = Post.new
        post.user_id = other_user.id
        post.datetime = Time.new(Time.now.year, Time.now.month, Time.now.day, 19, 0, 0)
        post.drinking_status = Post::DRINKING_HIGH
        post.save
        posts = user.aggregate_post
        assert_equal posts.length, 1
    end

end
