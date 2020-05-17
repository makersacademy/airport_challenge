require 'plane'

describe Plane do
  subject { Plane.new }

  let(:airport) { Airport.new }
  let(:bristol) { Airport.new }

  before do
    allow_any_instance_of(Weather).to receive(:rand) { 4 }
  end

  it 'has no airport when created' do
    expect(subject.instance_variable_get(:@docked_at)).to be_nil
  end

  it 'when an docked, it hold the airport its at' do
    subject.land(airport)
    expect(subject.instance_variable_get(:@docked_at)).to eq(airport)
  end

  it 'responds to land method with one argument' do
    expect(subject).to respond_to(:land)
  end

  it 'responds to take_off method with one argument' do
    expect(subject).to respond_to(:takeoff)
  end

  it 'does not allow takeoff when stormy' do
    subject.land(airport)
    allow_any_instance_of(Weather).to receive(:rand) { 9 }
    expect { subject.takeoff(airport) }.to raise_error('DANGER: Storm Forecast')
  end

  it 'does not allow land when stormy' do
    allow_any_instance_of(Weather).to receive(:rand) { 9 }
    expect { subject.land(airport) }.to raise_error('DANGER: Storm Forecast')
  end

  it 'raises error when trying to take off airport not docked at' do
    expect { subject.takeoff(airport) }.to raise_error("Plane not docked at #{airport}")
  end

  it 'raises error when trying to land but already at an airport' do
    subject.land(bristol)
    expect { subject.land(airport) }.to raise_error("Plane already docked at #{bristol}")
  end

end
