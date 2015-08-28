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
  it { is_expected.to respond_to :landed? }
  it { is_expected.to respond_to :flying? }

  it 'has to have a flying status when flying' do
    expect(subject).to be_flying
  end

  it 'plane changes the status when landed' do
    subject.lands!
    expect(subject).to be_landed
  end

  it 'plane changes the status when take_off' do
    subject.lands!
    subject.takes_off!
    expect(subject).to be_flying
  end





  #it 'has a flying status when created' do
    #expect(subject.status).to eq "flying"

  #it 'changes status to landing when landed' do
   # expect(subject.landed).to eq 'landed'

end
