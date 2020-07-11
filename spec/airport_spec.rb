require_relative '../lib/airport.rb'

describe Airport do
    describe '#full?' do
        it {is_expected.to respond_to :full?}
    end

    describe '#stormy?' do
        it {is_expected.to respond_to :stormy?}
    end

    describe '#capacity' do
        it {is_expected.to respond_to :capacity}
        it 'default capacity assigned when none provided' do
            expect(Airport.new.capacity).to eq Airport::DEFAULT_CAPACITY
        end
    end

    describe '#weather' do
        it {is_expected.to respond_to :weather}
        it 'weather condition is a String' do
            expect(Airport.new.weather).to be_a(String)
        end

        it 'weather to be from WEATHER_CONDITIONS' do
            airport1 = Airport.new
            expect(Airport::WEATHER_CONDITIONS).to include(airport1.weather)
        end
    end
end
