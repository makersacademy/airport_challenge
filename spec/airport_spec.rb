require 'airport'

describe Airport do
    let(:airport) {described_class.new}
  
    context 'Respond tests' do
        it {is_expected.to respond_to(:land)}
        it {is_expected.to respond_to(:take_off)}
        it {is_expected.to respond_to(:hanger)}
        it {is_expected.to respond_to(:weather_report)}
        it {is_expected.to respond_to(:permission_to_take_off)}
        it {is_expected.to respond_to(:permission_to_land)}
        it {is_expected.to respond_to(:full?)}
        it {is_expected.to respond_to(:capacity)}
        it {is_expected.to respond_to(:the_plane_has_already_landed?)}
    end
    
    describe '#weatehr_report' do
        it 'takes a random weather report and returns true or false' do
            random_weather = Weather.new
            weather = random_weather.random_weather_generator
            expect(airport.weather_report(weather)).to eq(true).or(eq(false))
        end
        
        it 'takes a weather report of Sunny and retuns true' do
            weather = "Sunny"
            expect(airport.weather_report(weather)).to eq(true)
        end
        
        it 'takes a weather report of Stormy and retuns false' do
            weather = "Stormy"
            expect(airport.weather_report(weather)).to eq(false)
        end
        
    end
    
    describe '#permission_to_land()' do
        let(:boeing) {double(:airplane)}
            before do
                allow(boeing).to receive(:the_airplane_has_landed_or_taken_off)
            end
            
        it 'gives permission and lands a plane when its sunny' do
            airport.weather_report("Sunny")
            expect(airport.permission_to_land(boeing)).to eq [boeing]
        end
        
        it 'Stops plans from landing when its stormy' do
            airport.weather_report("Stromy")
            expect(airport.permission_to_land(boeing)).to eq 'No permission to land due to poor weather!'
        end
    end
    
    describe '#permission_take_off' do
         let(:boeing) {double(:airplane)}
            before do
                allow(boeing).to receive(:the_airplane_has_landed_or_taken_off)
                airport.land(boeing)
            end
            
        it 'gives permission to take off if the weather is Sunny' do
            airport.weather_report("Sunny")
            expect(airport.permission_to_take_off).to eq boeing
            
        end
        
        it 'Stops planes from taking off and issues a failure when the weather is too bad' do
            airport.weather_report("Stormy")
            expect(airport.permission_to_take_off).to eq 'No permission to take off due to poor weather!'
            
        end
    end
    
    
    describe '#take_off' do

            it 'enables a plane to take_off' do
                boeing = double(:airplane)
                allow(boeing).to receive(:the_airplane_has_landed_or_taken_off)
                airport.land(boeing)
                expect(airport.take_off).to eq boeing
                expect(airport.hanger).to eq []
            end
            
            it 'raise an error if there are no planes' do
                expect{ airport.take_off }.to raise_error 'Airport empty!'
            end
    end
    
    describe '#land' do
        let (:boeing) {double(:airplane)}
        before do
            allow(boeing).to receive(:the_airplane_has_landed_or_taken_off)
        end
            
        it 'enables a plane to land' do
            expect(airport.land(boeing)).to eq [boeing]
         end   
        it 'Raises an error if the airport is full.' do
            20.times {airport.land Plane.new}
            expect{ airport.land(Plane.new) }.to raise_error 'Airport full!'
            end
            
        
    end
    
    context 'errors for landing' do
        describe '#full?' do
          
            it 'returns true or false if the hanger has reached full capacity' do
                expect(airport.full?).to eq false
                20.times {airport.land Plane.new}
                expect(airport.full?).to eq true
        
            end
        end
    
    
        describe '#the_plane_has_already_landed?' do
            it 'returns true or false if a plane ahs already landed' do
                boeing = double(:airplane)
                allow(boeing).to receive(:the_airplane_has_landed_or_taken_off)
                airport.land(boeing)
                expect(airport.the_plane_has_already_landed?(boeing)).to eq true
            end
        end
    end
    context 'edge raise errors' do
        describe 'Edge cases' do
            it "should not be possible to land a plane that has allready been landed" do
                boeing = Plane.new
                airport.land(boeing)
                expect{airport.land(boeing)}.to raise_error "This Plane has already landed!"
            end
        
        end
    end

    
end