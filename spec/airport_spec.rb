require 'airport'
require 'plane'
require 'weather'

describe Airport do

  let(:stormy_weather) { double 'Weather', weather_check: rand(8..10) }
  let(:stormy) { stormy_weather.weather_check }
  let(:sunny_weather) { double 'Weather', weather_check: rand(1..7) }
  let(:sunny) { sunny_weather.weather_check }
  let(:a_plane) { Plane.new }
  let(:another_plane) { Plane.new }

  describe "#capacity" do
    it 'should allow system designer to set a capacity' do
      an_airport = Airport.new(30)
      expect(an_airport.capacity).to eq 30
    end
  end

  describe "#land" do
    it 'should raise error message when the weather is stormy' do
      expect { subject.land(a_plane, stormy) }.to raise_error("It's too dangerous to land!")
    end
    it 'should raise error message when the airport is full' do
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new, sunny) }
      expect { subject.land(a_plane, sunny) }.to raise_error("The airport is full!")
    end
    it 'should raise error message when the plane has already landed' do
      subject.land(a_plane, sunny)
      expect { subject.land(a_plane, sunny) }.to raise_error("This plane has already landed!")
    end
  end

  describe "#take_off" do
    it 'should raise an error message when weather is stormy' do
      subject.land(a_plane, sunny)
      expect { subject.take_off(a_plane, stormy) }.to raise_error("It's too dangerous to take off!")
    end
    it 'should let the user choose which plane to fly' do
      subject.land(a_plane, sunny)
      expect(subject).to respond_to(:take_off).with(2).argument
    end
    it 'should raise an error when the plane is in a different airport' do
      other_airport = Airport.new
      other_airport.land(a_plane, sunny)
      expect { subject.take_off(a_plane, sunny) }.to raise_error("This plane is in a different airport!")
    end
    it 'should raise an error when the plane is already flying' do
      expect { subject.take_off(a_plane, sunny) }.to raise_error("This plane is already flying!")
    end
  end

  describe "#planes" do
    it 'should show that the plane is in the airport' do
      subject.land(a_plane, sunny)
      expect(subject.planes).to eq [a_plane]
    end
    it 'should show that the the plane is no longer in the airport' do
      subject.land(a_plane, sunny)
      subject.land(another_plane, sunny)
      subject.take_off(a_plane, sunny)
      expect(subject.planes).to eq [another_plane]
    end
  end
end
