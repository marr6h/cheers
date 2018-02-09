require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @relationship = Relationship.new(follower_id: users(:john).id, followed_id: users(:paul).id)
  end

  test "should be valid" do
    assert @relationship.valid?
  end

  test "should require a follower_id" do
    @relationship.follower_id = nil
    assert @relationship.invalid?
  end

  test "should require a followed_id" do
    @relationship.followed_id = nil
    assert @relationship.invalid?
  end

  test "should follow and unfollow a user" do
    john = users(:john)
    paul = users(:paul)
    assert_not john.following?(paul)
    john.follow(paul)
    assert john.following?(paul)
    assert paul.followers.include?(john)
    john.unfollow(paul)
    assert_not john.following?(paul)
  end
end
