require 'airport'

describe Airport do

  it 'returns the plane in the airport' do
    expect(Airport.new).to respond_to :planes
  end

end