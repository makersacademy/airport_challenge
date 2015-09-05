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

  let(:airport) { double :airport }
  let(:plane) { Plane.new }

  it { is_expected.to respond_to :flying? }

  it 'has a flying status when created' do
    expect(subject).to be_flying
  end

  it 'can land' do
    is_expected.to respond_to(:landed).with(1).argument
  end

  it 'has landed' do
    allow(airport).to receive(:dock).with(plane)
    expect(subject).not_to be_flying
  end

  it 'can take off' do
    is_expected.to respond_to(:taken_off).with(1).argument
  end

  it 'is flying after take off' do
    allow(airport).to receive(:release_plane).and_return(true)
    expect(subject.flying?).to eq(true)
  end


end
