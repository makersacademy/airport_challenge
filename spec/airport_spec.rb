require 'airport'

describe Airport do

  describe '#initialize' do
      it {is_expected.to respond_to :planes}

      it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
      end

      it 'has a default capacity that can be changed' do
        expect(Airport.new(6).capacity).to eq 6
      end

  end
end
