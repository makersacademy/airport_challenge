require './lib/airport'

describe Airport do
  class TestableAirport < Airport
    attr_reader :planes
    attr_accessor :weather_station
  end

  subject { TestableAirport.new(2, weather_station) }
  let(:plane) { Plane.new('BA165') }
  let(:weather_station) { instance_double('WeatherStation', :weather => :sunny) }

  describe '#land' do
    it 'adds plane to planes array' do
      subject.land(plane)
      expect(subject.planes.first).to eq plane
    end

    it 'raises error if airport is full' do
      2.times { subject.land(Plane.new('BA165')) }
      expect { subject.land(Plane.new('BA165')) }.to raise_error Airport::AirportFull
    end

    it 'raises error if plane is already landed' do
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error Airport::PlaneAlreadyLanded
    end
  end

  describe '#landed?' do
    it 'is true for a landed plane' do
      subject.land(plane)
      expect(subject.landed?(plane)).to eq true
    end

    it 'is false for a non-existent plane' do
      expect(subject.landed?(plane)).to eq false
    end
  end

  describe '#take_off' do
    it 'raises an error given non-existent plane' do
      expect { subject.take_off(plane) }.to raise_error Airport::PlaneNotFound
    end

    it 'removes plane from planes array' do
      subject.planes << plane
      subject.take_off(plane)
      expect(subject.planes).to be_empty
    end
  end

  describe 'weather rules' do
    context "in stormy weather" do
      let(:stormy_weather) { double("WeatherStation", :weather => :stormy) }

      it 'raises an error when landing' do
        subject.weather_station = stormy_weather
        expect { subject.land(plane) }.to raise_error Airport::BadWeather
      end

      it 'raises an error when taking off' do
        subject.planes << plane
        subject.weather_station = stormy_weather
        expect { subject.take_off(plane) }.to raise_error Airport::BadWeather
      end
    end
  end
end