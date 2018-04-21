require 'airport'
require 'plane'
require 'weather'

describe Airport do

  let(:stormy_weather) { double 'Weather', weather_value: rand(8..10) }
  let(:sunny_weather) { double 'Weather', weather_value: rand(1..7) }

  describe "#capacity" do
    it 'should allow system designer to set a capacity' do
      expect(subject).to respond_to :capacity
    end
    it 'should allow system designer to set a capacity' do
      an_airport = Airport.new(30)
      expect(an_airport.capacity).to eq 30
    end
  end

  describe "#land" do
    it 'should allow a plane to land' do
      expect(subject).to respond_to(:land)
    end
    it 'should raise error message when the weather is stormy' do
      a_plane = Plane.new
      expect { subject.land(a_plane, stormy_weather.weather_value) }.to raise_error("It's too dangerous to land!")
    end
    it 'should raise error message when the airport is full' do
      a_plane = Plane.new
      Airport::DEFAULT_CAPACITY.times { subject.land(a_plane, sunny_weather.weather_value) }
      expect { subject.land(a_plane, sunny_weather.weather_value) }.to raise_error("The airport is full!")
    end
  end

  describe "#take_off" do
    it 'should allow a plane to take off' do
      expect(subject).to respond_to(:take_off)
    end
    it 'should raise an error message when weather is stormy' do
      a_plane = Plane.new
      subject.land(a_plane, sunny_weather.weather_value)
      expect { subject.take_off(stormy_weather.weather_value) }.to raise_error("It's too dangerous to take off!")
    end
  end

  describe "#planes" do
    it 'should show that the plane is in the airport' do
      a_plane = Plane.new
      subject.land(a_plane, sunny_weather.weather_value)
      expect(subject.planes).to eq [a_plane]
    end
    it 'should show that the the plane is no longer in the airport' do
      a_plane = Plane.new
      subject.land(a_plane, sunny_weather.weather_value)
      subject.take_off(sunny_weather.weather_value)
      expect(subject.planes).to eq []
    end
  end

end
