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

  test "Should require a entry_from" do
      entry = Entry.new
      entry.post_id = 0
      assert !entry.save
  end

end
