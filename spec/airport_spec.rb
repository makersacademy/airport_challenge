require 'airport'
require 'plane'
require 'weather'

describe Airport do
  # 1. #land - airport.land(plane)
  it { is_expected.to respond_to(:land).with(1).argument }

  # 2. #takeoff - airport.takeoff(plane)
  it { is_expected.to respond_to(:takeoff) }

# 3. Raises an error for takeoff when weather is stormy
  describe '#takeoff' do
    it 'raises an error on takeoff if weather is stormy' do
      # create a plane
      plane = Plane.new
      # airport is subject
      # @stormy_weather = true
      @stormy_weather = true
      expect { airport.takeoff(plane) }.to raise_error "Unable to takeoff. Weather is stormy."
    end
  end




end
