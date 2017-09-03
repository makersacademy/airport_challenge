require 'airport'
require 'plane'

describe Airport do
  subject(:airport) {described_class.new}

  it {is_expected.to respond_to :lands_plane}

describe '#land' do
  it 'lands plane at airport' do
    plane = Plane.new
    expect(airport.land(plane)).to eq (plane)
  end
end

end
