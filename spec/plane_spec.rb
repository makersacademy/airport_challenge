require_relative '../lib/plane'
STATES = { landed: true, in_air: false }.freeze
AIRPORT_ID = 33
NEW_AIRPORT_ID = 44
describe Plane do
  before do
    Plane.new
  end
  it "initial state is in air" do
    expect(subject.state).to eq(STATES[:in_air])
  end
  it "initial airport id is null" do
    expect(subject.airport_id).to eq(-1)
  end
  it "take off instruction invoked only when landed" do
    expect(subject).to respond_to :take_off
  end
  it 'tak off should change state to in air only when landed' do
    subject.land(AIRPORT_ID)
    subject.take_off(AIRPORT_ID)
    expect(subject.state).to eq(STATES[:in_air])
  end
  it 'invalid request: take_off when in_air' do
    expect { subject.take_off(AIRPORT_ID) }.to raise_error('already in state: in air')
  end
  it 'land should save state to landed' do
    subject.land(AIRPORT_ID)
    expect(subject.state).to eq (STATES[:landed])
  end
  it 'land should save airport_id' do
    subject.land(AIRPORT_ID)
    expect(subject.airport_id).to eq(AIRPORT_ID)
  end
  it 'invalid request: land when landed' do
    subject.land(AIRPORT_ID)
    expect { subject.land(AIRPORT_ID) }.to raise_error('already in state: landed')
  end
  it 'invalid request: plane not a this airport' do
    subject.land(NEW_AIRPORT_ID)
    expect { subject.take_off(AIRPORT_ID) }.to raise_error('plane not a this airport')
  end
end
