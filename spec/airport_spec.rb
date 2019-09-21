require 'airport'

describe Airport do

  describe 'initialize' do
    it 'defaults to 100 planes if no capacity is given' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'takes a number as the airport capacity' do
      airport = Airport.new(250)
      expect(airport.capacity).to eq 250
    end
  end

end