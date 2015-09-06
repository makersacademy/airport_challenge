require 'plane'

## Note these are just some guidelines!
## Feel free to write more tests!!

# When we create a new plane, it should be "flying",
# thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should
# be "landed"
#
# When the plane takes of from the airport, it should be "flying" again
#
# Think about your implementation - does it allow a plane to be "flying"
# and landed?
# Are you testing that?

describe Plane do

  let(:airport_allow){double(:airport_allow, allow_landing?: true, receive_plane: nil)}
  let(:airport_not_allow){double(:airport_not_allow, allow_landing?: false)}

  describe 'landing' do

    it 'can land at given airport' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'is landed after landing' do
      subject.land(airport_allow)
      expect(subject).to be_landed
    end

    it 'is located at given airport after landing' do
      subject.land(airport_allow)
      expect(subject.location).to eq airport_allow
    end

    it 'checks to see if airport allows landing' do
      expect(airport_allow).to receive :allow_landing?
      subject.land(airport_allow)
    end

    it 'calls airport#receive_plane method when landing is allowed' do
      expect(airport_allow).to receive :receive_plane
      subject.land(airport_allow)
    end

    it 'raises error when landing not allowed' do
      expect{subject.land(airport_not_allow)}.to raise_error "Airport refuses landing request"
    end

  end

  describe 'taking off' do

    it 'can take off' do
      subject.land(airport_allow)
      expect(subject).to respond_to(:take_off)
    end

    it 'is flying after take off' do
      subject.land(airport_allow)
      subject.take_off
      expect(subject).to be_flying
    end

  end

end
