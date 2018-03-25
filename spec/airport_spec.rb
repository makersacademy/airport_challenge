require 'airport'
require 'plane'
require 'weather'

describe Airport do
  subject(:gatwick) { described_class.new }
  let(:ggajb) { double :plane }

  it 'instructs the plane to land' do
    expect(ggajb).to receive(:touchdown)
    subject.land ggajb
  end

  it 'has the plane it has landed' do
    expect(ggajb).to receive(:touchdown)
    gatwick.land(ggajb)
    expect(gatwick.ramp).to include ggajb
  end

  it 'has no plane after takeoff' do
    expect(ggajb).to receive(:touchdown)
    gatwick.land(ggajb)
    expect(ggajb).to receive(:takeoff)
    gatwick.takeoff(ggajb)
    expect(gatwick.ramp).to eq []
  end
end
