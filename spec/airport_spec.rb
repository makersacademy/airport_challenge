require 'airport'

describe Airport do 
  let(:plane) { double :plane }

  describe '#land' do
    it 'can land plane' do
      subject.land(plane)
      expect(subject.planes.include? plane).to eq true
    end
  end

  describe '#contain' do
    it 'can confirm contains plane' do
      subject.land(plane)
      expect(subject.contain? plane).to eq true
    end
  end
end
