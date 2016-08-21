require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }

  it 'instructs plane to land' do
    plane = double(:plane, :landed => false)
    expect(subject.land(plane)).to eq [plane]
  end

  it 'instructs plane to take off' do
    plane = double(:plane, :flying => false, :landed => true)
    subject.land(plane)
    expect(subject.take_off(plane)).to eq plane
  end

  it 'docks plane in hangar' do
    plane = double(:plane, :flying => false, :landed => true)
    subject.land(plane)
    expect(subject.hangar).to include plane
  end

end
