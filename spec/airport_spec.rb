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
    let(:mockHangar) { double :hangar } # Can you add real/dummy objects to hangar array?
    # let(:mockNote) { double :note, :title => 't1', :body => 'b1' }
    # let(:broken_bike) { double :bike, working: false }

    describe '#land', :land do
        it { is_expected.to respond_to(:land).with(1).argument }
        it 'adds Plane to @hangar' do
            subject.land(:mockPlane)
            expect(subject.hangar).to include (:mockPlane)
        end
    end

    describe '#take_off', :take_off do 
        it { is_expected.to respond_to(:take_off).with(1).argument }
        it 'removes Plane from @hangar' do 
            subject.land(:mockPlane)
            subject.take_off(:mockPlane)
            expect(subject.hangar).to be_empty
        end
    end

end