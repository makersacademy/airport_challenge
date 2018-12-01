require 'airport'

describe Airport do
  let(:plane) { Plane.new }

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:in_airport?).with(1).argument }
  it { is_expected.to respond_to(:take_off) }

  it 'lands a plane' do
    expect(subject.land(plane)).to eq [plane]
  end

  it 'lets a plane take_off' do
    subject.land(plane)
    expect(subject.take_off).to eq plane
  end

  it 'checks if a plane is not in an airport' do
    expect(subject.in_airport?(plane)).to eq false
  end

  it 'checks if a plane is in an airport' do
    subject.land(plane)
    expect(subject.in_airport?(plane)).to eq true
  end

end
