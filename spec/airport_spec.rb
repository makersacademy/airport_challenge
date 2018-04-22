require 'airport'
require 'plane'
require 'weather'

describe Airport do

  let(:stormy_weather) { double 'Weather', weather_value: rand(8..10) }
  let(:stormy_weather_value) { stormy_weather.weather_value }
  let(:sunny_weather) { double 'Weather', weather_value: rand(1..7) }
  let(:sunny_weather_value) { sunny_weather.weather_value }
  let(:a_plane) { Plane.new }

  describe "#capacity" do
    it 'should allow system designer to set a capacity' do
      an_airport = Airport.new(30)
      expect(an_airport.capacity).to eq 30
    end
  end

  describe "#land" do
    it 'should raise error message when the weather is stormy' do
      expect { subject.land(a_plane, stormy_weather_value) }.to raise_error("It's too dangerous to land!")
    end
    it 'should raise error message when the airport is full' do
      Airport::DEFAULT_CAPACITY.times { subject.land(a_plane, sunny_weather_value) }
      expect { subject.land(a_plane, sunny_weather_value) }.to raise_error("The airport is full!")
    end
  end

  describe "#take_off" do
    it 'should raise an error message when weather is stormy' do
      subject.land(a_plane, sunny_weather_value)
      expect { subject.take_off(stormy_weather_value) }.to raise_error("It's too dangerous to take off!")
    end
  end

  describe "#planes" do
    it 'should show that the plane is in the airport' do
      subject.land(a_plane, sunny_weather_value)
      expect(subject.planes).to eq [a_plane]
    end
    it 'should show that the the plane is no longer in the airport' do
      subject.land(a_plane, sunny_weather_value)
      subject.take_off(sunny_weather_value)
      expect(subject.planes).to eq []
    end
  end

end
