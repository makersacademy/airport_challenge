require 'airport'     # Require 'plane' in order to double instances of the Plane class? No

describe Airport do  
    subject(:airport) { described_class.new }
    let(:mockPlane) { double :plane }       # let(:plane) { instance_double("Plane") }
    let(:mockWeatherStation) { double :weatherstation}
    # let(:mockWeather) { double :weather }
    # let(:calmWeather) { double :weather, conditions_safe? => true }
    # let(:stormyWeather) { double :weather, conditions_safe? => false }
    # let(:spyPlane) { spy :plane_double}
    # let(:spyWeatherStation) { spy :weatherstation_double, conditions_safe? => true}
    
    describe ' #initialize ', :initialize do 
        it 'with an empty @hangar' do 
            expect(subject.hangar).to be_empty           
        end
        it 'with a default capacity of 1' do
            expect(subject.capacity).to eq 1
        end
        it 'allows for variable capcity' do           # diff_capacity = 30  
            large_airport = Airport.new(50)           # large_airport = Airport.new(diff_capacity)
            expect(large_airport.capacity).to eq 50   # exepect(large_airport.capacity).to eq diff_capacity
        end                                          
    end
    
    describe ' #status ', :status do 
        before { subject.hangar << mockPlane }
        it 'provides Plane location' do 
            expect(subject.status(mockPlane)).to eq("#{mockPlane} is in the hangar")
        end
    end

    describe ' #take_off', :take_off do 
        it { is_expected.to respond_to(:take_off).with(1).argument }

        context 'when weather is calm' do  
            before { subject.hangar << mockPlane }
                it 'allows Plane to launch' do 
                    allow(mockWeatherStation).to receive(:conditions_safe?).and_return(true) 
                    allow(mockPlane).to receive(:fly).and_return(true)
                        subject.take_off(mockPlane)   # expect(mockPlane.flying).to eq true
                        expect(mockPlane).to have_received(:fly)
                end
                it 'confirms Plane is no longer at the airport' do 
                    allow(mockWeatherStation).to receive(:conditions_safe?).and_return(true) 
                    allow(mockPlane).to receive(:fly)
                        expect(subject.take_off(mockPlane)).to eq("#{mockPlane} has left the airport")
                end
            end
        end

        context 'when weather is stormy' do  # let(:stormyWeather) { double :weather, conditions_safe? => false }
             before { subject.hangar << mockPlane }
               it 'denies take_off' do 
                    allow(mockWeatherStation).to receive(:conditions_safe?).and_return(false)
                    allow(mockPlane).to receive(:fly)
                    expect{ subject.take_off(mockPlane) }.to raise_error('ERROR - Weather is stormy')
                end 
         end
    end

    describe ' #land ', :land do
        it { is_expected.to respond_to(:land).with(1).argument }
        it 'denies landing when hangar is full' do
            Airport::DEFAULT_CAPACITY.times { subject.land(mockPlane) }
            expect { subject.land(mockPlane) }.to raise_error 'ERROR - Hangar is at capacity'
          end

        context 'when weather is calm' do 
            it 'adds planes to @hangar' do
                allow(mockWeatherStation).to receive(:conditions_safe?).and_return(true)
                subject.land(mockPlane)
                expect(subject.hangar).to include(mockPlane)
            end
            it 'allows landing' do 
                allow(mockWeatherStation).to receive(:conditions_safe?).and_return(true)
                # allow(subject).to receive(:status).and_return("#{mockPlane} is in the hangar")
                expect{ subject.status(mockPlane) }.to eq ("#{mockPlane} is in the hangar")
            end
        end
    
        context 'when weather is stormy' do
                it 'denies landing' do 
                allow(mockWeatherStation).to receive(:conditions_safe?).and_return(false)
                expect{ subject.land(mockPlane) }.to raise_error('ERROR - Weather is stormy')
            end
        end


end
