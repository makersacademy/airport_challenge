require 'weather.rb'

describe 'Weather' do
  describe '#flying conditions' do
    let(:weather) { double :weather }
    it 'confirms when the weather is suitable for flying' do
      allow(weather).to receive(:flying_conditions).and_return(false)
      expect(weather.flying_conditions).to eq(false)
    end

    let(:weather) { double :weather }
    it 'confirms when the weather is not suitable for flying' do
      allow(weather).to receive(:flying_conditions).and_return(true)
      expect(weather.flying_conditions).to eq(true)
    end
  end
end
