require 'airplane'

describe Airplane do
  it 'tells a plane to land at an airport' do
    expect(subject).to respond_to :land_plane
  end
  it 'tells a plane to take off and confirm it is no longer in the airport' do
    expect(subject).to respond_to :take_off
  end
end
