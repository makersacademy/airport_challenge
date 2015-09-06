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

  let(:airport_allow){double(:airport_allow, allow_landing?: true, allow_take_off?: true, receive_plane: nil, release_plane: nil)}
  let(:airport_not_allow){double(:airport_not_allow, allow_landing?: false)}
  let(:land_not_take_off){double(:land_not_take_off, allow_landing?: true, allow_take_off?: false, receive_plane: nil, release_plane: nil)}

  it 'flying when created' do
    expect(subject).to be_flying
  end

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

    it 'raises error when already landed' do
      subject.land(airport_allow)
      expect{subject.land(airport_allow)}.to raise_error "Already landed"
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

    it 'calls airport#release_plane method when taking off' do
      subject.land(airport_allow)
      expect(airport_allow).to receive :release_plane
      subject.take_off
    end

    it 'raises error when already flying' do
      expect{subject.take_off}.to raise_error "Already flying"
    end

    it 'checks to see if airport allows take off' do
      subject.land(airport_allow)
      expect(subject.location).to receive :allow_take_off?
      subject.take_off
    end

    it 'raises error when taking off is not allowed' do
      subject.land(land_not_take_off)
      expect{subject.take_off}.to raise_error "Airport refuses take off"
    end

  end

end
