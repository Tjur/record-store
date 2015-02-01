require 'test_helper'

class ArtistTest < ActiveSupport::TestCase

  test "should not save artist without name" do
    artist = Artist.new
    assert_not artist.save, "Saved an artist without a name"
  end

  # test "the truth" do
  #   assert true
  # end
end
