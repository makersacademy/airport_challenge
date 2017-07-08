require 'airport'

describe Airport do
    it {is_expected.to respond_to(:land)}
    it {is_expected.to respond_to(:take_off)}
    it {is_expected.to respond_to(:hanger)}
    it {is_expected.to respond_to(:permission_from_traffic_control)}
    it {is_expected.to respond_to(:permission_to_take_off)}
    it {is_expected.to respond_to(:permission_to_land)}
    
    
    describe '#traffic_control' do
        it 'takes a random weather report and returns true or false' do
        weather = Weather.new
        weather_report = weather.random_weather_generator
        expect(subject.permission_from_traffic_control(weather_report)).to eq(true).or(eq(false))
        end
        
        it 'takes a weather report of Sunny and retuns true' do
            weather_report = "Sunny"
            expect(subject.permission_from_traffic_control(weather_report)).to eq(true)
        end
        
        it 'takes a weather report of Stormy and retuns false' do
            weather_report = "Stormy"
            expect(subject.permission_from_traffic_control(weather_report)).to eq(false)
        end
        
    end
    
    describe '#permission_to_land()' do
        
        it 'gives permission and lands a plane when its sunny' do
        boeing = double(:airplane)
        allow(boeing).to receive(:the_airplane_has_landed_or_taken_off)
        subject.permission_from_traffic_control("Sunny")
        expect(subject.permission_to_land(boeing)).to eq [boeing]
        end
        
        it 'Stops plans from landing when its stormy' do
        boeing = double(:airplane)
        allow(boeing).to receive(:the_airplane_has_landed_or_taken_off)
        subject.permission_from_traffic_control("Stromy")
        expect(subject.permission_to_land(boeing)).to eq 'No permission to land due to poor weather!'
        end
    end
    
    describe '#permission_take_off' do
        
        it 'gives permission to take off if the weather is Sunny' do
            boeing = double(:airplane)
            allow(boeing).to receive(:the_airplane_has_landed_or_taken_off)
            subject.land(boeing)
            subject.permission_from_traffic_control("Sunny")
            expect(subject.permission_to_take_off).to eq boeing
            
        end
        
        it 'Stops planes from taking off and issues a failure when the weather is too bad' do
            boeing = double(:airplane)
            allow(boeing).to receive(:the_airplane_has_landed_or_taken_off)
            subject.land(boeing)
            subject.permission_from_traffic_control("Stormy")
            expect(subject.permission_to_take_off).to eq 'No permission to take off due to poor weather!'
            
        end
    end
    
    describe '#take_off' do

            it 'enables a plane to take_off' do
                boeing = double(:airplane)
                allow(boeing).to receive(:the_airplane_has_landed_or_taken_off)
                subject.land(boeing)
                expect(subject.take_off).to eq boeing
                expect(subject.hanger).to eq []
            end
            
            it 'raise an error if there are no planes' do
                airport = Airport.new
                expect{ airport.take_off }.to raise_error 'Airport empty!'
            end
    end
    
    describe '#land' do
        it 'enables a plane to land' do
            boeing = double(:airplane)
            allow(boeing).to receive(:the_airplane_has_landed_or_taken_off)
            expect(subject.land(boeing)).to eq [boeing]
         end   
        it 'Raises an error if the airport is full.' do
            20.times {subject.land Plane.new}
            expect{ subject.land(Plane.new) }.to raise_error 'Airport full!'
            end
            
        
    end
    
end