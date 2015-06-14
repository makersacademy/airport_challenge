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

  it { is_expected.to respond_to :flying? }

  it { is_expected.to respond_to :landing }

  it { is_expected.to respond_to :landed? }

  it { is_expected.to respond_to :take_off }


  it 'is flying when created' do
    expect(subject).to be_flying
  end

  it 'is landed after landing' do
    subject.landing
    expect(subject).to be_landed
  end

  it 'is not flying when landed' do
    subject.landing
    expect(subject).to_not be_flying  
  end
 
  it 'is flying after take off' do
    subject.take_off
    expect(subject).to be_flying
  end

  it 'is not landed when flying' do
    subject.take_off
    expect(subject).to be_flying
  end

end
