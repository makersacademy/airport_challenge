require 'airport'
require 'plane'
require 'weather'

describe Airport do
  # Set variables to be used in the tests
  subject(:an_airport) { Airport.new }
  let(:another_airport) { Airport.new }
  let(:a_plane) { Plane.new }
  let(:another_plane) { Plane.new }
  let(:stormy_weather) { double 'Weather', check: rand(8..10) }
  let(:stormy) { stormy_weather.check }
  let(:sunny_weather) { double 'Weather', check: rand(1..7) }
  let(:sunny) { sunny_weather.check }

  # Run the tests
  describe "#capacity" do
    it 'should allow system designer to set a capacity' do
      an_airport = Airport.new(30)
      expect(an_airport.capacity).to eq 30
    end
  end

  describe "#land" do
    it 'should raise error message when the weather is stormy' do
      expect { an_airport.land(a_plane, stormy) }.to raise_error("It's too dangerous to land!")
    end
    it 'should raise error message when the airport is full' do
      Airport::DEFAULT_CAPACITY.times { an_airport.land(Plane.new, sunny) }
      expect { an_airport.land(a_plane, sunny) }.to raise_error("The airport is full!")
    end
    it 'should raise error message when the plane has already landed' do
      an_airport.land(a_plane, sunny)
      expect { an_airport.land(a_plane, sunny) }.to raise_error("This plane has already landed!")
    end
  end

  describe "#take_off" do
    it 'should raise an error message when weather is stormy' do
      an_airport.land(a_plane, sunny)
      expect { an_airport.take_off(a_plane, stormy) }.to raise_error("It's too dangerous to take off!")
    end
    it 'should raise an error when the plane is in a different airport' do
      another_airport.land(a_plane, sunny)
      expect { an_airport.take_off(a_plane, sunny) }.to raise_error("This plane is in a different airport!")
    end
    it 'should raise an error when the plane is already flying' do
      expect { an_airport.take_off(a_plane, sunny) }.to raise_error("This plane is already flying!")
    end
  end

  describe "#planes" do
    it 'should show that the plane is in the airport' do
      an_airport.land(a_plane, sunny)
      expect(an_airport.planes).to include a_plane
    end
    it 'should show that the the plane is no longer in the airport' do
      an_airport.land(a_plane, sunny)
      an_airport.land(another_plane, sunny)
      an_airport.take_off(a_plane, sunny)
      expect(an_airport.planes).to eq [another_plane]
    end
  end
end
