require 'airport'

describe Airport do
  describe '#initialize' do
    it 'creates an empty airport' do
      expect(subject.planes).to eq []
    end
  end
end
