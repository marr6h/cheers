require 'test_helper'

class EntryTest < ActiveSupport::TestCase

  test "post_id requires some integer" do
      entry = Entry.new
      assert entry.invalid?
      entry.post_id = 0
      assert entry.save
  end

end
