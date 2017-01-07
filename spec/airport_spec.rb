require './lib/Airport'
require './lib/Plane'

describe Airport do

  it 'airport controller can instruct plane to take off' do
    expect(Airport.new).to respond_to :takeoff_plane
end
end
