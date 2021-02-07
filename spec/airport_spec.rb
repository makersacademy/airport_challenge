require 'airport'
require 'plane'

describe Airport do
  let(:airport) { Airport.new 10 }
  let(:small_airport) { Airport.new 1 }
  let(:plane_1) { Plane.new }

  describe '#capacity' do
    it 'returns a new Airport object with capacity set' do
      expect(airport.capacity).to_not be nil
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
    it 'should return true when hangar.count <= airport.capacity' do
      allow(small_airport).to receive(:weather) { 'sunny' }
      plane_1.land(small_airport)
      expect(small_airport.hangar_full?).to be true
    end
    it 'should return false hangar.count > airport.capacity' do
      allow(airport).to receive(:weather) { 'sunny' }
      plane_1.land(airport)
      expect(airport.hangar_full?).to be false
    end
  end

  describe '#weather' do
    it 'should return either `sunny` or `stormy`' do
      options = ['sunny', 'stormy']
      index = options.find_index(airport.weather)
      expect(index).to_not be_nil
    end
  end
end
