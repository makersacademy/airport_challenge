require 'airport'

describe Airport do

  describe '#capacity' do
    it 'returns a new Airport object with capacity set' do
      expect(subject.capacity).to_not be nil
    end
  end

  describe "#modify_capacity" do
    it 'should amend the default capacity for hangar' do
      small_airport = Airport.new(2)
      small_airport.modify_capacity(10)
      expect(small_airport.capacity).to eq (10)
    end
  end

  describe '#hangar' do
    it 'should return a collection' do
      expect(subject.hangar).to be_an_instance_of Array
    end
  end

  describe '#hangar_full?' do
    context 'when the hangar is full' do
      it 'should return true' do
        small_airport = Airport.new @capacity=1
        plane_1 = Plane.new
        plane_1.land(small_airport)
        expect(small_airport.hangar_full?).to be true
      end
    end
  end

  # describe '#stormy?' do
  #   it 'should exist' do
  #     expect(subject).to respond_to(:stormy?)
  #   end
  #   context 'when rand_num is greater than or eql to 8' do
  #     it 'should return true' do
  #       allow(subject.stormy?).to receive(:rand_num){ 8 }
  #       expect(subject.stormy?).to be true
  #     end
  #   end
  #   context 'when rand_num is less than or eql to 7' do
  #     it 'should return false' do
  #       allow(subject.stormy?).to receive(:rand_num){ 7 }
  #       expect(subject.stormy?).to be false
  #     end
  #   end
  # end
  describe 'weather' do
    it 'should randomly select between stormy and sunny' do
      # allow(subject).to receive(:weather) { 'stormy' }
      # expect(subject.weather).to match('stormy') # => I want to match two strings outcome
    end
  end
    # context 'when the hangar is not full' do
      # it 'should return false if the hangar is not full' do
      #   small_airport = Airport.new @capacity=3
      #   plane_1 = Plane.new
      #   plane_1.land(small_airport)
      #   expect(small_airport.hangar_full?).to be false
      # end
    # end
end
