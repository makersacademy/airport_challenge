require 'airport'

describe Airport do

  # model_airport = Airport.new

  describe '#capacity' do
    it 'returns a new Airport object with capacity set' do
      expect(subject.capacity).to_not be nil
    end
  end

  describe '#hangar' do
    it 'should return a collection' do
      expect(subject.hangar).to be_an_instance_of Array
    end
  end

end
