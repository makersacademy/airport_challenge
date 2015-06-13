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
# Think about your implementation - does it allow a plane to be "flying" and landed?
# Are you testing that?

describe Plane do

  it 'is flying when created' do
    expect(subject.flying).to eq true
  end

  it 'cannot land when created' do
    expect(subject.can_land).to eq false
  end

  describe 'landing' do
    it 'can prepare_to_land when instructed' do
      expect(subject.prepare_to_land).to eq true
    end

    it 'is landed after landing' do
      expect(subject.land).to eq false
    end
  end

  describe 'taking off' do
    it 'can prepare_to_take_off when instructed' do
      expect(subject.prepare_to_take_off).to eq true
    end

    it 'is flying after take off' do
      expect(subject.take_off).to eq true
    end
  end

end
