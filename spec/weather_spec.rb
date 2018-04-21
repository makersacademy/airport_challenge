require 'weather'

describe Weather do

  describe '#stormy?' do
    before { allow(subject).to receive(:generate_weather).and_return(true)}
    it 'returns a boolean' do
      expect(subject.stormy?).to eq true  
    end
  end
end
