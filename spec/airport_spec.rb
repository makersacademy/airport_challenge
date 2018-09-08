require 'airport'
require 'plane'
require 'weather'

describe Airport do
  subject { Airport.new(weather, planes) }
  let(:weather) { Weather.new }
  let(:planes) { [ Plane.new, Plane.new ] }


  describe '#land' do
    it 'instruct a plane to land' do
      plane = Plane.new
      subject.land(plane)
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'should not land a landed plane' do
      plane = Plane.new
      initial_length = subject.planes.length
      subject.land(plane)
      subject.land(plane)
      expect(subject.planes.length).to eq(initial_length + 1)
    end

    it 'includes the plane which landed' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end

  end

  describe '#take_off' do
    it 'instruct a plane to take off' do
      plane = Plane.new
      subject.take_off(plane)
      expect(subject).to respond_to(:take_off).with(1).argument
    end

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
      weather = Weather.new('stormy')
      airport = Airport.new(weather, planes)
      plane = Plane.new

      expect(airport.take_off(plane)).to eq ("Sorry! Plane can not take due to bad weather condition")
    end

  end
end
