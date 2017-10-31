require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @user = users (:john)
  end

  # test "the truth" do
  #   assert true
  # end

  test 'valid drinking_status' do
    post = Post.new
    post.user_id = @user.id
    now = Time.now
    post.datetime = Time.new(now.year, now.month, now.day, 19, 0, 0)
    post.drinking_status = Post::DRINKING_HIGH
    assert post.save
    post.drinking_status = Post::DRINKING_MIDDLE
    assert post.save
    post.drinking_status = Post::DRINKING_LOW
    assert post.save
  end

  test 'invalid drinking_status' do
    post = Post.new
    post.user_id = @user.id
    post.datetime = Time.now
    # empty drinking_status
    assert_equal false, post.save
    # does not definied drinking_status
    post.drinking_status = 0
    assert_equal false, post.save
    # does not definied drinking_status
    post.drinking_status = 4
    assert_equal false, post.save
  end

end
