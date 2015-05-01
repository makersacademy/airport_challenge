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

    it 'land' do
      subject.land
      expect(subject::status).to eq "landed"
    end

    it 'has a flying status when created' do
      expect(subject::status).to eq "flying"
    end

    it 'has a flying status when in the air' do
      expect(subject::status).to eq "flying"
    end

    it 'can take off' do
      subject.land
      expect(subject).to respond_to :take_off
    end

    it 'change its status to flying after taking off' do
      subject.land
      subject.take_off
      expect(subject::status).to eq "flying"
    end
  end

end
