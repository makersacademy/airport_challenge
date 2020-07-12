require_relative '../lib/weather.rb'

describe Weather do
    describe '#initialize' do
        it 'tests that when the random number is not equal to 1 the weather is not stormy' do
            weather = Weather.new
            allow(weather).to receive(:rand).and_return(2)
            expect(weather.stormy?).to eq false
        end
    end
end