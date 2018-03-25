require 'airport'
require 'plane'
require 'weather'

describe Airport do
  subject(:gatwick) { described_class.new }
  let(:ggajb) { double :plane }

  it 'has the plane after landing' do
    gatwick.land(ggajb)
    expect(gatwick.ramp).to include ggajb
  end

  it 'has no plane after takeoff' do
    gatwick.land(ggajb)
    gatwick.takeoff(ggajb)
    expect(gatwick.ramp.length).to_eq 0
  end 
end
