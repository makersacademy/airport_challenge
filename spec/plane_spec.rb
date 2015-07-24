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

  it 'is flying on creation' do
    expect(subject).to be_flying
  end

  it 'can land' do
    expect(subject).to respond_to :land
  end

  it 'is not landed if flying' do
    expect(subject).to_not be_landed
  end

  it 'can take off' do
  end


  describe '#land' do

    it 'is landed after landing' do
      subject.land(:airport)
      expect(subject).to be_landed
    end

    it 'is not flying after landing' do
      subject.land(:airport)
      expect(subject).to_not be_flying
    end
  end

  describe '#take_off' do

    it 'is flying after taking off' do
      subject.land(:airport)
      subject.take_off(:airport)
      expect(subject).to be_flying
    end
  end



  # xit 'is flying when created'

  # xit 'can land'

  # xit 'is landed after landing'

  # xit 'can take off'

  # xit 'is flying after take off'

end
