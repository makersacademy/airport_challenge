require 'weather'

describe Weather do

  let(:weather) { Weather.new }

  describe ' #generate ' do
    it 'should produce
     weather condition' do
      expect(weather).to respond_to(:produce)
    end

    it 'should return sunny' do
      expect_any_instance_of(Array).to receive(:sample).and_return('sunny')
      expect(weather.produce).to eq('sunny')
    end

    it 'should return stormy' do
      expect_any_instance_of(Array).to receive(:sample).and_return('stormy')
      expect(weather.produce).to eq('stormy')
    end
  end

end