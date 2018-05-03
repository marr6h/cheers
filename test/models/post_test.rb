require 'test_helper'

class PostTest < ActiveSupport::TestCase

  test 'user_id is need to input' do
    post = Post.new
    post.invalid?
    post.user_id = users(:john)
    post.valid?
  end

  test 'A datetime is in a valid range of datetime' do
    post = Post.new
    post.user_id = users(:john).id
    now = Time.now
    post.datetime = Time.new(now.year, now.month, now.day, 19, 0, 0)
    post.valid?
    post.datetime = Time.new(now.year, now.month, now.day, 4, 59, 59) + 1.day
    post.valid?
  end

  test 'A datetime is in a invalid range of datetime' do
    post = Post.new
    post.user_id = users(:john).id
    now = Time.now
    post.datetime = Time.new(now.year, now.month, now.day, 18, 59, 59)
    post.invalid?
    post.datetime = Time.new(now.year, now.month, now.day, 5, 0, 0) + 1.day
    post.invalid?
  end

end
