require 'airport'

describe AirPort do

    let(:airport) { AirPort.new }
    let(:plane) { AirPlane.new }

    it '#instruction' do
        expect(subject).to respond_to :instruction
    end

    it '#confirmation_message' do
        expect(airport.confirmation_message("Confirmed - take off")).to eq "Confirmed - take off"
    end

    it '#leave_runway' do
        airport.land_to_runway(plane)           
        expect(airport.leave_runway(plane)).not_to include(plane)
    end

    describe '#change_capacity' do
        it '#change_capacity' do
            expect(subject.change_capacity(5)).to eq 5
        end

        it '#fail_if_stormy' do
            capacity = 5
            airport.change_capacity(capacity)

            capacity.times do
                airport.land_to_runway AirPlane.new 
            end
            
            expect { airport.land_to_runway AirPlane.new }.to raise_error 'Airport full'
        end

        describe '#land_to_runway' do
            it '#land_to_runway' do
                expect(airport.land_to_runway(plane)).to include(plane) 
            end

            it '#fail_if_stormy' do
                AirPort::DEFAULT_CAPACITY.times do
                    subject.land_to_runway AirPlane.new
                end
                expect { subject.land_to_runway AirPlane.new }.to raise_error 'Airport full'
            end
        end

        describe '#stormy' do

            #let(:airport) { AirPort.new (stormy = true) }

            it '#stormy?' do
                expect(airport).to respond_to :stormy?         
            end
                                            
            it '#report_stormy' do
                expect(airport.report_stormy(true)).to eq true
            end

            it '#leave_runway' do
                airport.report_stormy(true)
                expect { airport.leave_runway(plane) }.to raise_error 'Too Stormy' 
            end
            
            it '#land_to_runway' do
                airport.report_stormy(true)
                expect { airport.land_to_runway(plane) }.to raise_error 'Too Stormy' 
            end        
        end
    end
end