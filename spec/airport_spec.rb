require 'airport'

describe Airport do

  describe '#initialize' do
      it {is_expected.to respond_to :planes}

      it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end
end
