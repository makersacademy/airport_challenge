require 'weather'

describe Weather do

  let(:weather) { Weather.new }

  describe ' #generate ' do
    it 'should generate a random weather condition' do
      expect(weather).to respond_to(:generate)
    end

    it 'should return sunny' do
      expect_any_instance_of(Array).to receive(:sample).and_return('sunny')
      expect(weather.generate).to eq('sunny')
    end

    it 'should return stormy' do
      expect_any_instance_of(Array).to receive(:sample).and_return('stormy')
      expect(weather.generate).to eq('stormy')
    end
  end

end
