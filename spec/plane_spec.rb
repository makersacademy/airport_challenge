require './lib/plane'

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

  let(:airport) { double :airport, accept_plane: true }

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it { is_expected.to respond_to :status }

  it "should land at the right airport" do
    expect(subject.land airport).to eq airport
  end

  it "should take off from the right airport" do
    expect(subject.take_off airport).to eq airport
  end

  xit "should not be able to land if the airport is full" do
  end

  it 'has a flying status when created' do
    expect(subject.status).to eq "flying"
  end

  it 'changes status to landed after it has landed' do
    plane = Plane.new
    plane.land airport
    expect(plane.status).to eq "landed"
  end

  xit 'has a flying status when in the air'

  it 'changes its status to flying after taking off' do
    subject.status = "landed"
    subject.take_off airport
    expect(subject.status).to eq "flying"
  end
end
