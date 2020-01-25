require 'airport'
require 'plane'

describe Airport do
# this is for the landing_plane method in airport.rb
  it { is_expected.to respond_to :land }

  it "land a plane" do
    plane = subject.land
    expect(plane).to be_landing
  end
end
