require 'airport'

describe Airport do
  describe '#initialize' do
    it 'initializes with default capacity of 1' do
      expect(Airport.new.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'initializes with custom capacity' do
      expect(Airport.new(10).capacity).to eq 10
    end
  end
end
