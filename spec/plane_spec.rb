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

  context 'taking off and landing' do
    it { is_expected.to respond_to :status }
    it { is_expected.to respond_to :land }
    it { is_expected.to respond_to :take_off }

  end
end
