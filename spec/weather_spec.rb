require 'weather'

describe Weather do
weather = Weather.new

  describe '#stormy?' do
    it 'is stormy?' do
      should respond_to(:stormy?)
    end
    it 'test is stormy is true' do
      expect(subject.set_weather(40)).to eq true
    end
    it 'test is stormy is false' do
      expect(subject.set_weather(39)).to eq false
    end
    it 'test if set_weather doesnt raise an error' do
      expect { subject.stormy? }.not_to raise_error
    end
  end
end
