require 'airport'
require 'plane'

RSpec.describe Airport do
  it "should harbour planes" do
    expect(subject).to respond_to(:harbour_plane).with(1).arguments
  end

  it "should commission flights" do
    plane = Plane.new

    expect(subject).to respond_to(:commission_flight).with(1).arguments
    expect(subject.commission_flight(plane)).to be plane
  end
end
