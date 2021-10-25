require 'weather_reporter'

describe WeatherReporter do 
    subject(:weather_reporter) {described_class.new}

    describe '#stormy' do 
        it 'can be non stormy' do
            expect(weather_reporter.stormy?).to be false
        end 
        it 'can be stormy' do 
            expect(weather_reporter.stormy?).to be true
        end 
    end
end 