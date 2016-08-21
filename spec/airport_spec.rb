require 'airport'
require 'plane'

describe Airport do

  describe '#land_plane(plane)' do

    it 'lands a plane at an airport and reports plane as landed' do
      plane = double(:plane, report_landed: true)
      expect(subject.land_plane(plane)).to eq [plane]
    end

    it 'prevents landing when weather is stormy' do
      plane = double(:plane, report_take_off: false)
      weather = double(:weather, forecast: "Stormy")
      subject.current_forecast = weather
      expect { subject.land_plane(plane) }.to raise_error "Delay landing!"
    end

    skip 'prevents landing when airport is full' do
    end
  end

  describe '#take_off' do

    it 'tells a plane to take off from an airport and reports as departed' do
      plane = double(:plane, report_landed: true, report_take_off: false)
      weather = double(:weather, forecast: "Sunny")
      subject.current_forecast = weather
      subject.land_plane(plane)
      expect(subject.take_off).to eq plane
    end

    it 'prevents planes taking off when weather is stormy' do
      plane = double(:plane, report_landed: true, report_take_off: false)
      subject.land_plane(plane)
      weather = double(:weather, forecast: "Stormy")
      subject.current_forecast = weather
      expect { subject.take_off }.to raise_error "All flights grounded"
    end

  end
end
