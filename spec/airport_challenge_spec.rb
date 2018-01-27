require 'airport' # connects to airport.rb (location of class).
# This is my feature test document!

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport

describe Airport do # desribe feature test for Airport class.
  it { is_expect.to respond_to(:land_plane).with(1).argument } # Class responds to land_plane.

  it "lands planes" do # What does the method "land_plane" do?
  expect(subject.land_plane).to be_landed
  end
end
