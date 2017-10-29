require 'airport'

describe Airport do
  subject(:test_airport) { described_class.new }
  let(:test_capacity_airport) { Airport.new(50) }

  describe 'airport' do
    it 'should create a new airport' do
      expect(test_airport).to be_instance_of(Airport)
    end
  end

  describe 'capacity' do
    it 'should be able to have a capacity' do
      expect(test_airport.capacity).to be_instance_of(Integer)
    end

    it 'should create an airport with default capacity of 20' do
      expect(test_airport.capacity).to eq(20)
    end

    it 'should create an airport with custom capacity' do
      expect(test_capacity_airport.capacity).to eq(50)
    end
  end

  describe 'number_of_planes' do
    it 'should return the number of planes' do
      expect(test_airport.number_of_planes).to be_instance_of(Integer)
    end
  end

  describe 'add_plane' do
    it 'should add 1 to number_of_planes' do
      test_airport.add_plane
      expect(test_airport.number_of_planes).to eq(1)
    end
  end

end
