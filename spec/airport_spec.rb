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

end
