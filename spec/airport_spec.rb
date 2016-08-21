require 'airport'
require 'plane'

describe Airport do

  let(:weather_is_sunny) { subject.current_forecast.generate_weather(80) }
  let(:weather_is_stormy) { subject.current_forecast.generate_weather(81) }
  let (:plane) { double(:plane, report_landed: true, report_take_off: false)}



  describe '#initialize' do
    it "defaults capacity" do
      plane = double(:plane, report_landed: true)
      weather_is_sunny
      described_class::DEFAULT_CAPACITY.times {subject.land_plane(double(:plane2, report_take_off: true, report_landed: false))}
      weather_is_sunny
      expect { subject.land_plane(plane) }.to raise_error "Full airport"
    end
  end

  describe '#land_plane(plane)' do


    it 'lands a plane at an airport and reports plane as landed' do
      plane = double(:plane, report_landed: true)
      weather_is_sunny
      expect(subject.land_plane(plane)).to eq [plane]
    end

    it 'prevents landing when weather is stormy' do
      plane = double(:plane, report_take_off: true)
      weather_is_stormy
      expect { subject.land_plane(plane) }.to raise_error "Delay landing!"
    end

    it 'prevents landing when airport is full' do
      weather_is_sunny
      subject.capacity.times { subject.land_plane(double(:plane, report_take_off: true, report_landed: false)) }
      weather_is_sunny
      expect { subject.land_plane(plane) }.to raise_error "Full airport"
    end

    it 'will not land a plane that is already landed' do
      plane = double(:plane, report_landed: true)
      weather_is_sunny
      subject.land_plane(plane)
      if subject.planes.include? plane
        expect { subject.land_plane(plane) }.to raise_error "already landed"
      end
    end
   end

  describe '#take_off' do

    it 'tells a plane to take off from an airport and reports as departed' do
      plane = double(:plane, report_landed: true, report_take_off: false)
      weather_is_sunny
      subject.land_plane(plane)
      weather_is_sunny
      expect(subject.take_off).to eq plane
    end

    it 'prevents planes taking off when weather is stormy' do
      plane = double(:plane, report_landed: true, report_take_off: false)
      weather_is_sunny
      subject.land_plane(plane)
      weather_is_stormy
      expect { subject.take_off }.to raise_error "All flights grounded"
    end

  end
end
