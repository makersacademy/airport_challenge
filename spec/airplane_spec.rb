require 'airplane'

describe Airplane do

  describe 'plane_status' do
    it 'should be landed when a new plane is initialized' do
      expect(subject.landed).to eq true
    end
  end

  describe 'land_plane' do
    it 'should respond to land_plane method' do
      expect(subject).to respond_to(:land_plane).with(1).argument
    end

    it 'should push that plane into the airport.planes array' do
      airport = Airport.new
      subject.land_plane(airport)
      expect(airport.planes).to eq [subject]
    end

    it 'should respond to plane_status' do
      expect(subject).to respond_to(:plane_status)
    end

    it 'should confirm the plane has landed with the plane status' do
      airport = Airport.new
      subject.plane_status
      subject.land_plane(airport)
      expect(subject.landed).to eq true
    end
  end

  describe 'take_off' do
    it 'should respond to take_off method' do
      expect(subject).to respond_to(:take_off).with(1)
    end

    it 'should remove that plane from the airport.planes array' do
      airport = Airport.new
      plane1 = Airplane.new
      plane2 = Airplane.new
      plane1.land_plane(airport)
      plane2.land_plane(airport)
      plane1.take_off(airport)
      expect(airport.planes).to eq [plane2]
    end

    it 'should confirm that the plane has taken off with the plane status' do
      airport = Airport.new
      plane1 = Airplane.new
      plane2 = Airplane.new
      plane1.land_plane(airport)
      plane2.land_plane(airport)
      plane1.take_off(airport)
      expect(plane1.landed).to eq false
    end
  end
end
