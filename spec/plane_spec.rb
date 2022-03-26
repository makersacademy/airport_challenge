require_relative '../lib/plane'

describe Plane do
  let(:plane) { Plane.new }

  it 'can land in the airports hangar' do
    airport = double("airport", :hangar => [])
    expect(plane.land(airport)).to eq [plane]
  end
end
