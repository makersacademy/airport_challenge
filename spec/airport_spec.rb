require 'airport'

describe Airport do
  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to(:plane) }

  it 'docks planes' do
    plane = Plane.new
    expect(subject.dock(plane)).to eq plane
  end

  it 'returns docked planes' do
    plane = Plane.new
    subject.dock(plane)
    expect(subject.plane).to eq plane
  end
end
