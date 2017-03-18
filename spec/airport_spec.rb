require 'airport'
require 'plane'
require 'weather'

describe Airport do
  # 1. #land - airport.land(plane)
  it { is_expected.to respond_to(:land).with(2).argument }

  # 2. #takeoff - airport.takeoff(plane)
  it { is_expected.to respond_to(:takeoff).with(2).argument }

# 3. Raises an error for takeoff when weather is stormy
  describe '#takeoff' do
    let(:stormy_weather) { double :stormy_weather }
    it 'raises an error on takeoff if weather is stormy' do
      # create a plane
      plane = Plane.new
      weather = double :stormy_weather
      allow(weather).to receive(:report).and_return(true)
      # airport is subject
      # @stormy? = true
      storm = weather.report
      expect { subject.takeoff(plane, storm) }.to raise_error "Unable to takeoff. Weather is stormy."
    end
  end

  # 4. Raises an error for land when weather is stormy
    describe '#land' do
      let(:stormy_weather) { double :stormy_weather }
      it 'raises an error on land if weather is stormy' do
        # create a plane
        plane = Plane.new
        weather = double :stormy_weather
        allow(weather).to receive(:report).and_return(true)
        # airport is subject
        # @stormy? = true
        storm = weather.report
        expect { subject.land(plane, storm) }.to raise_error "Unable to land. Weather is stormy."
      end
    end


end
