require 'airport'

RSpec.describe Airport do
  it { is_expected.to be_ready }

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it { is_expected.to respond_to(:land).with(1).argument }

  it 'returns an airborne plane' do
    plane = Plane.new
    subject.take_off(plane)
    expect(subject.take_off(plane)).to eq plane
  end

  it 'returns a landed plane' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.land(plane)).to eq plane
  end
end