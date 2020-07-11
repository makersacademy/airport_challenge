require_relative '../lib/airport.rb'

describe Airport do
    describe '#full?' do
        it {is_expected.to respond_to :full?}
    end

    describe '#stormy?' do
        it {is_expected.to respond_to :stormy?}

        it 'returns true when weather is stormy' do
            allow(Airport::WEATHER_CONDITIONS).to receive(:sample).and_return("stormy")
            airport1 = Airport.new
            expect(airport1.stormy?).to eq true
        end
    end

    describe '#capacity' do
        it {is_expected.to respond_to :capacity}
        it 'default capacity assigned when none provided' do
            expect(Airport.new.capacity).to eq Airport::DEFAULT_CAPACITY
        end
        it 'capacity can be changed from the default upon initialization' do
            expect(Airport.new(200).capacity).to eq 200
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
    # I want to instruct a plane to land at an airport
    describe '#land(plane)' do
        it 'pushes the Plane object into an array' do
            plane1 = double("plane1")
            expect(plane1).to receive(:flying?).and_return(true)
            expect(plane1).to receive(:landed)
            allow(Airport::WEATHER_CONDITIONS).to receive(:sample).and_return("sunny")
            expect(Airport.new.land(plane1).count).to eq 1  
        end
    # I want to prevent landing when weather is stormy 
        it 'plane cannot be landed if weather is stormy' do
            plane1 = double("plane1")
            expect(plane1).to receive(:flying?).and_return(true)
            allow(Airport::WEATHER_CONDITIONS).to receive(:sample).and_return("stormy")
            expect{Airport.new.land(plane1)}.to raise_error("A plane cannot be landed") 
        end
    
    # I want to prevent landing when the airport is full
        
    end
    
    # I want to instruct a plane to take off from an airport 
    # and confirm that it is no longer in the airport
end