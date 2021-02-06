require 'airport'

describe Airport do

  # model_airport = Airport.new

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
    it 'should return true if the hangar full' do
      small_airport = Airport.new @capacity=1
      plane_1 = Plane.new
      plane_1.land(small_airport)
      expect(small_airport.hangar_full?).to be true
    end
    # it 'should return fall if the hangar is not full' do
    #   small_airport = Airport.new @capacity=3
    #   plane_1 = Plane.new
    #   plane_1.land(small_airport)
    #   expect(small_airport.hangar_full?).to be false
    # end
  end

end
