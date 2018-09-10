require 'airport'
require 'plane'
require 'weather'

describe Airport do
  subject { Airport.new(weather, planes) }
  let(:weather) { Weather.new("sunny") }
  let(:planes) { [] }

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }
  it { is_expected.to respond_to(:change_capacity).with(1).argument }

  describe '#initialize' do
    it "raises an error when number of planes are more than maximum capacity" do
      expect { Airport.new(weather, [Plane.new, Plane.new], 1) }.to raise_error(RuntimeError, "Planes count is greater than maximum capacity")
    end

    it "should not raising any errors when all arguments are correctly passed" do
      expect { Airport.new(weather, [Plane.new], 1) }.not_to raise_error
    end
  end

  describe '#land' do
    it 'should not land a landed plane' do
      plane = double("Plane")
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error(RuntimeError, "Plan has already landed")
    end

    it 'includes the plane which landed' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end

    it 'prevents plane to land when it stormy' do
      weather = Weather.new('stormy')
      airport = Airport.new(weather, planes)
      # If we uncomment the line below, this passing test would fail.
      # This is one way to stub weather conditions.
      # airport.stub(:stormy?) { false }
      plane = Plane.new
      expect { airport.land(plane) }.to raise_error(RuntimeError, "Plane can not land due to bad weather condition")
    end

    it 'raises error and prevent landing when the airport is full' do
      weather = Weather.new('sunny')
      airport = Airport.new(weather, [])
      airport.max_capacity.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error(RuntimeError, "Airport is full")
    end
  end

  describe '#take_off' do

    it 'should not take off a plane which is already taken off' do
      plane = Plane.new
      weather = Weather.new('sunny')
      airport = Airport.new(weather, planes)
      initial_length = airport.planes.length
      airport.land(plane)
      airport.take_off(plane)
      airport.take_off(plane)
      expect(airport.planes.length).to eq(initial_length)
    end

    it 'clears the plane which take off from airport' do
      weather = Weather.new('sunny')
      airport = Airport.new(weather, planes)
      plane = Plane.new
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).not_to include(plane)
    end

    it 'prevents plane from take off when it stormy' do
      weather = double("weather")
      allow(weather).to receive(:stormy?).and_return(true)
      airport = Airport.new(weather, planes)
      plane = double("Plane")
      expect { airport.take_off(plane) }.to raise_error(RuntimeError, "Plane can not take off due to bad weather condition")
    end

  end

  describe '#change_capacity' do
    it 'changes capacity' do
      subject.change_capacity(20)
      expect(subject.max_capacity).to eq(20)
    end

    it 'raises an error when new capacity is less than existing number of planes in airport' do
      planes = [Plane.new, Plane.new, Plane.new]
      airport = Airport.new(weather, planes, 3)
      expect { airport.change_capacity(2) }.to raise_error(RuntimeError, 'New capacity is less than existing plane')
    end

    it 'changes to new capacity when new capcity is greater that existing planes in airport' do
      planes = [Plane.new, Plane.new]
      airport = Airport.new(weather, planes, 2)
      airport.change_capacity(20)
      expect(airport.max_capacity).to eq(20)
    end
  end
end
