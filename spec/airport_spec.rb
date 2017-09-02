require 'airport'

describe Airport do

  describe '#initialize' do

    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

  end

end
