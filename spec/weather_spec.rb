require 'weather'

describe Weather do

  describe '#current_weather' do
    it 'return current weather is stormy' do
      allow(Kernel).to receive(:rand).with(0..5).and_return(5)
      expect(subject.current_weather).to eq "stormy"
    end

    it 'return current weather is sunny' do
      allow(Kernel).to receive(:rand).with(0..5).and_return(0)
      expect(subject.current_weather).to eq "sunny"
    end
  end
end
