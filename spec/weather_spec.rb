require 'weather'

describe Weather do
  describe '#stormy' do
    it 'generates weather' do
      expect(subject).to receive(:rand).and_return(2)
      expect(subject.stormy?).to eq false
    end
  end 
end
 
