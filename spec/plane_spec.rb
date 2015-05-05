require 'plane'

## Note these are just some guidelines!
## Feel free to write more tests!!

# When we create a new plane, it should have a "flying" status,
# thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should
# have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status
# should become "flying"

describe Plane do

  context 'it can' do

    let (:heathrow) { Airport.new }

    it 'land' do
      allow(heathrow).to receive(:storm_brewing) { 'sunny' }
      heathrow.land(subject)
      expect(subject::status).to eq "landed"
    end

    it 'has a flying status when created' do
      expect(subject::status).to eq "flying"
    end

    it 'has a flying status when in the air' do
      expect(subject::status).to eq "flying"
    end

    it 'change its status to flying after taking off' do
      allow(heathrow).to receive(:storm_brewing) { 'sunny' }
      heathrow.land(subject)
      heathrow.take_off(subject)
      expect(subject::status).to eq "flying"
    end
  end
end
