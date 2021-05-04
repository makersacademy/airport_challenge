require 'weather'

describe Weather do

  it { is_expected.to respond_to :fine_weather? }

  describe Weather do
    it 'returns true for good weather' do
      allow(subject).to receive(:rand).and_return 2
      expect(subject.fine_weather?).to eq true
    end
  
    it 'returns false for bad weather' do
      allow(subject).to receive(:rand).and_return 1
      expect(subject.fine_weather?).to eq false
    end
  end

end 
