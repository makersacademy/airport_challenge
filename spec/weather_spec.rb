require 'weather'

describe Weather do

  let(:weather) { Weather.new }

  describe ' #generate ' do
    it 'should generate a random weather condition' do
      expect(weather).to respond_to(:generate)
    end

    it 'should return sunny' do
      expect(weather).to receive(:rand).and_return(1)
      expect(weather.generate).to eq('sunny')
    end

    it 'should return stormy' do
      expect(weather).to receive(:rand).and_return(9)
      expect(weather.generate).to eq('stormy')
    end
  end

end
