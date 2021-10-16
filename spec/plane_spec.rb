require_relative '../lib/plane'
STATES = { landed: true, in_air: false }.freeze
subject = Plane.new
describe Plane do
  it "should have an id" do
    expect(subject.id).to eq('p1')
  end
  it "initial state is in air" do
    expect(subject.state).to eq(STATES[:in_air])
  end
  it "take off instruction invoked only when landed" do
    expect(subject).to respond_to :take_off
  end
  it 'tak off should change state to in air only when landed' do
    subject.land
    subject.take_off
    expect(subject.state).to eq(STATES[:in_air])
  end
  it 'invalid request: take_off when in_air' do
    expect { subject.take_off }.to raise_error('already in state: in air')
  end
  it 'land should land only when in air' do
    subject.land
    expect(subject.state).to eq (STATES[:landed])
  end
  it 'invalid request: land when landed' do
    expect { subject.land }.to raise_error('already in state: landed')
  end
end
