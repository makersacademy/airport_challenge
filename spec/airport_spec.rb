require 'airport'

RSpec.describe Airport do

  describe 'initializing the airport' do
    it 'creates an empty array of planes' do
      expect(subject.planes).to eq []
    end
  end

  describe 'setting capacity' do
    it 'sets the capacity of the airport to 100 if no capacity is given' do
      allow(subject).to receive(:rand).and_return(1)
      expect(subject.capacity).to eq 100
    end

    it 'overwrites default capacity if capacity argument given' do
      airport = Airport.new(75)
      allow(airport).to receive(:rand).and_return(1)
      expect(airport.capacity).to eq 75
    end
  end
end
