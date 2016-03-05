require 'airplane'

describe Airplane do
let(:airport) {double :airport, :planes => [subject], :full? => false}
let(:airport1) {double :airport, :planes => [plane2], :full? => false}
let(:airport2) {double :airport, :planes => [], :full? => false}
let(:airport3) {double :airport, :planes => [], :full? => true}
let(:plane1) {Airplane.new}
let(:plane2) {Airplane.new}

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
      subject.land_plane(airport2)
      expect(airport2.planes).to eq [subject]
    end

    it 'should respond to plane_status' do
      expect(subject).to respond_to(:plane_status)
    end

    it 'should confirm the plane has landed with the plane status' do
      subject.plane_status
      subject.land_plane(airport2)
      expect(subject.landed).to eq true
    end

    it 'should raise an error when the airport is full' do
      10.times {airport3.planes << Airplane.new}
      expect{ (subject).land_plane(airport3) }.to raise_error 'Airport is full'
    end
  end

  describe 'take_off' do
    it 'should respond to take_off method' do
      expect(subject).to respond_to(:take_off).with(1)
    end

    it 'should remove that plane from the airport.planes array' do
      plane1.land_plane(airport1)
      plane1.take_off(airport1)
      expect(airport1.planes).to eq [plane2]
    end

    it 'should confirm that the plane has taken off with the plane status' do
      plane2.take_off(airport2)
      expect(plane2.landed).to eq false
    end
  end
end
