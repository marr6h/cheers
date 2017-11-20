require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should require a post_id" do
      entry = Entry.new
      entry.entry_from = 0
      assert !entry.save
  end

  test "should require a entry_from" do
      entry = Entry.new
      entry.post_id = 0
      assert !entry.save
  end

  test "should search user" do
      entry = entries(:first)
      assert_not entry.from_user.nil?
  end

  test "should set cheer is 0" do
      entry = Entry.new
      entry.post_id = 1
      entry.entry_from = nil
      entry.cheer = 0
      entry.save
      assert entry.cheer == 0
  end
end
