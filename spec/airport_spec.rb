# UR1. I want to instruct a plane to land at an airport
# UR2. I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
# UR3. I want to prevent takeoff when weather is stormy 
# UR4. I want to prevent landing when weather is stormy 
# UR5. I want to prevent landing when the airport is full 
# SR1. I would like a default airport capacity that can be overridden as appropriate

require 'airport'

describe Airport do  
    subject(:airport) { described_class.new }

    describe '#land', :land do
        it { is_expected.to respond_to(:land).with(1).argument }

    #     it 'stores plane in @hangar' do 
    end

    describe '#take_off', :take_off do 
        it { is_expected.to respond_to(:take_off).with(1).argument }
    end


end