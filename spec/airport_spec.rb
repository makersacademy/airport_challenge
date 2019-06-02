require 'airport'

describe Airport do
  it 'exists as a class' do
    expect(described_class).to eq(Airport)
  end

  it { is_expected.to respond_to(:land).with(1).argument }

  it 'lands a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq(plane)
  end

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it { is_expected.to respond_to(:plane) }
end
