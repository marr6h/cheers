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
