require 'airport'

describe Airport do


  subject(:airport) { described_class.new }

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it { is_expected.to respond_to(:stormy?) }

  it 'Confirm the plane has landed' do
    plane = double(:plane)
    expect(subject.land(plane)).to eq [plane]
  end

  it 'Confirm the plane has taken off' do
    plane = double(:plane)
    subject.land(plane)
    expect(subject.take_off(plane)).to eq plane
end

it 'Receive report if the weather is stormy' do
    expect(subject.stormy?).to be(true).or be(false)
end
end
