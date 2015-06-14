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
  let(:airport) {Airport.new}

  it {is_expected.to respond_to :flying?}

  it 'is flying when created' do
    expect(subject).to be_flying
  end

  it "request a landing from airport" do
    subject.land(airport)
    expect(subject.flying?).to eq false
  end

  it 'can land' do
    is_expected.to respond_to :land
  end

  it 'is landed after landing' do
    subject.land(airport)
    expect(subject).not_to be_flying
  end

  it 'cannot land if it is already on the ground' do
    subject.land(airport)
    expect { subject.land(airport) }.to raise_error "Plane already on ground"
  end

  it 'cannot take off if it is already flying' do
    expect { subject.takeoff(airport) }.to raise_error "Plane already flying"

  end


  it 'can take off' do
    is_expected.to respond_to :takeoff
  end

  it 'requests a takeoff from an airport' do
    subject.land(airport)
    expect(subject.takeoff(airport)).to eq true

  end

  it 'is flying after take off' do
    subject.land(airport)
    subject.takeoff(airport)
    expect(subject).to be_flying
  end

end
