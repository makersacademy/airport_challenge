require 'airport'

describe Airport do
  subject(:airport) { described_class.new }

   describe '#initialize' do
     it 'has a default capacity, unless specified' do
       expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
     end
    it 'can have a variable capacity when initialized' do
      random_capacity = Random.rand(100)
      airport = described_class.new random_capacity
      expect(airport.capacity).to eq random_capacity
    end
   end
end
