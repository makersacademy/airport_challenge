require './lib/airport'

describe Airport do
  class AirportSpy < Airport
    attr_reader :planes
    attr_accessor :weather_station
  end

  subject { AirportSpy.new(2, weather_station) }
  let(:plane) { double("Plane", :is_landed= => nil) }
  let(:weather_station) { double("WeatherStation", :weather => :sunny) }

  describe '#land' do
    it 'adds plane to planes array' do
      subject.land(plane)
      expect(subject.planes.first).to eq plane
    end

    it 'sets plane to landed' do
      expect(plane).to receive(:is_landed=).with(true)
      subject.land(plane)
    end

    it 'raises error if airport full' do
      2.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error Airport::AirportFull
    end

    it 'raises error if plane already landed' do
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error Airport::PlaneAlreadyLanded
    end
  end

  describe '#landed?' do
    it 'is true for landed plane' do
      subject.land(plane)
      expect(subject.landed?(plane)).to eq true
    end

    it 'is false for non-existent plane' do
      expect(subject.landed?(plane)).to eq false
    end
  end

  describe '#take_off' do
    it 'raises error when taking off non-existent plane' do
      expect { subject.take_off(plane) }.to raise_error Airport::PlaneNotFound
    end

    it 'removes plane from planes array' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).to be_empty
    end

    it 'sets plane to not landed' do
      subject.land(plane)
      expect(plane).to receive(:is_landed=).with(false)
      subject.take_off(plane)
    end
  end

  describe 'weather rules' do
    it 'raises error when landing during bad weather' do
      weather = double("WeatherStation", :weather => :stormy)
      airport = Airport.new(1, weather)
      expect { airport.land(plane) }.to raise_error Airport::BadWeather
    end

    it 'raises error when taking off during bad weather' do
      airport = AirportSpy.new(1, double("WeatherStation", :weather => :sunny))
      airport.land(plane)
      airport.weather_station = double("WeatherStation", :weather => :stormy)
      expect { airport.take_off(plane) }.to raise_error Airport::BadWeather
    end
  end
end