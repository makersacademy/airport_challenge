require 'airport'
require 'plane'

describe Airport do
# this is for the landing_plane method in airport.rb

  it { is_expected.to respond_to :planes_in_airport }

  it {is_expected.to respond_to(:land).with(1).argument }
  
  it "land a plane" do
    plane = subject.planes_in_airport
    expect(plane).to be_landing
  end
end
