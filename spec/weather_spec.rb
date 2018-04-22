require 'weather'

describe Weather do

  let(:weather) { Weather.new }

  describe '#condition' do
    it 'should generate a weather condition' do
      expect(weather).to respond_to(:condition)
    end

    it 'should return clear' do
      expect_any_instance_of(Array).to receive(:sample).and_return('clear')
      expect(weather.condition).to eq 'clear'
    end

    it 'should return stormy' do
      expect_any_instance_of(Array).to receive(:sample).and_return('stormy')
      expect(weather.condition).to eq 'stormy'
    end
  end

end
