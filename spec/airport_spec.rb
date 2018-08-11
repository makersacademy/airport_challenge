# UR1. Instruct a plane to land at an airport
# UR2. Instruct a plane to take off from an airport and confirm it's no longer in the airport
# UR3. Prevent takeoff when weather is stormy 
# UR4. Prevent landing when weather is stormy 
# UR5. Prevent landing when the airport is full 
# SR1. Default airport capacity that can be overridden as appropriate

require 'airport'
# require 'plane'
# Do I need to require 'plane' in order to double instances of the Plane class?

describe Airport do  
    subject(:airport) { described_class.new }
    let(:mockPlane) { double :plane }
    # let(:mockFlyingPlane) { double :plane, :flying => false } # OK?
    # let(:mockHangar) { double :hangar } # Can you add real/dummy objects to hangar array?

    describe '#land', :land do
        it { is_expected.to respond_to(:land).with(1).argument }
        it 'adds Plane to @hangar' do
            subject.land(mockPlane)
            expect(subject.hangar).to include (mockPlane)
        end
    end

    describe '#take_off', :take_off do 
        it { is_expected.to respond_to(:take_off).with(1).argument }
        it 'removes Plane from @hangar' do 
            allow(mockPlane).to receive(:fly).and_return(true)
            subject.land(mockPlane)  # What is good practice here?
            subject.take_off(mockPlane)
            expect(subject.hangar).to be_empty
        end
        it 'toggles #flying? to true' do 
            allow(mockPlane).to receive(:fly).and_return(true)
            allow(mockPlane).to receive(:flying?).and_return(true)
            subject.take_off(mockPlane)
            expect(mockPlane.flying?).to be true
        end
        it 'confirms plane is no longer at the airport' do 
            allow(mockPlane).to receive(:fly).and_return(true)
            allow(mockPlane).to receive(:flying?).and_return(true)
            expect(subject.take_off(mockPlane)).to eq "#{mockPlane} has left the airport"
        end
            
    end

end