# frozen_string_literal: true

# This is my unit test document!

require 'airport' # connects to airport.rb (location of class).

# I want to instruct a plane to land at an airport [Y]
# I want to instruct a plane to take off from an airport
# and confirm that it is no longer in the airport

describe Airport do # describe feature test for Airport class.
  it { is_expected.to respond_to(:land_plane).with(1).argument }
  it { is_expected.to respond_to :fly_plane }

  it 'allows planes to land' do
    plane = Plane.new
    expect(subject.land_plane(plane)).to eq [plane]
  end

  it 'allows planes to take off' do
    expect(subject.fly_plane).to be_nil
  end
end
