require "weather"

describe Weather do
    subject(:weather) { described_class.new }
    it 'should respond to the method stormy?' do
        expect(weather).to respond_to(:stormy?)
    end
    it 'should return a boolean on whether the weather is stormy or not' do
        expect(weather.stormy?).to be(true).or be(false)
    end
end
