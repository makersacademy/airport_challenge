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

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it { is_expected.to respond_to :unlandable? }

  it { is_expected.to respond_to :status }

  it "should land at the right airport" do
    destination = double :airport
    expect(subject.land destination).to eq destination
  end

  it "should take off from the right airport" do
    airport = double :airport
    expect(subject.take_off airport).to eq airport
  end

  it "should not be able to land if the airport is full" do
    airport = double :airport, accept_plane: true
    6.times { airport.accept_plane Plane.new }
    expect(subject).to be_unlandable
  end

  it 'has a flying status when created' do
    expect(subject.status).to eq "flying"
  end

  it 'changes status to landed after it has landed' do
    plane = Plane.new
    plane.land double :airport
    expect(plane.status).to eq "landed"
  end

  xit 'has a flying status when in the air'

  it 'changes its status to flying after taking off' do
    subject.status = "landed"
    subject.take_off double :airport
    expect(subject.status).to eq "flying"
  end
end
