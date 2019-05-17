require './lib/airport'

describe Airport do
    let(:plane) { Plane.new }

    it {is_expected.to respond_to(:land).with(1).argument}
    
    describe 'plane landing' do
      it 'stores plane in hangar when landed' do
        subject.land(plane)
        expect(subject.plane).to eq plane
      end
    end

    describe 'plane taking off' do
        it 'removes plane from hangar after takeoff' do
            subject.take_off(plane)
            puts Airport.new.take_off(plane)
            expect(subject.hangar.length). to eq(1)
        end
    end

# when a plane takes off i want to confirm it is no longer in the airport
# i want the hangar to be empty when a plane takes off

  end

