require 'airport'

describe Airport do
  subject(:airport) { described_class.new }

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it 'Confirm the plane has landed' do
    plane = double(:plane)
    expect(subject.land(plane)).to eq true
  end

  it 'Confirm the plane has taken off' do
    plane = double(:plane)
    expect(subject.take_off(plane)).to eq true
  end
end
