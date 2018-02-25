require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  it 'is flying' do
    expect(plane.plane_status).to eq "flying"
  end
end
