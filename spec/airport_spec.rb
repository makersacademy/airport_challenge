require 'airport'
require 'plane'

describe Airport do
  let(:airport) { Airport.new 10 }
  let(:small_airport) { Airport.new 1 }
  let(:plane_1) { Plane.new }

  describe '#capacity' do
    it 'returns the hangar capacity as integer' do
      expect(airport.capacity).to be_an_instance_of Integer
    end
  end

  describe "#modify_capacity" do
    it 'should amend the default capacity for hangar' do
      small_airport.modify_capacity 10
      expect(small_airport.capacity).to eq 10
    end
  end

  describe '#hangar' do
    it 'should return a collection' do
      expect(subject.hangar).to be_an_instance_of Array
    end
  end

  describe '#hangar_full?' do

    before :each do
      allow(small_airport).to receive(:weather) { 'sunny' }
      allow(airport).to receive(:weather) { 'sunny' }
      allow(plane_1).to receive(:in_flight) { true }
    end

    it 'should return true when the plane count in hangar >= airport capacity' do
      plane_1.land(small_airport)
      expect(small_airport.hangar_full?).to be true
    end
    it 'should return false the plane count in hangar < airport.capacity' do
      plane_1.land(airport)
      expect(airport.hangar_full?).to be false
    end
  end

  describe '#weather' do
    it 'should return either `sunny` or `stormy`' do
      expect(subject.weather).to(satisfy { |value| ['sunny', 'stormy'].include?(value) })
    end
  end
end
