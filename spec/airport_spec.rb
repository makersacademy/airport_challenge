require './docs/airport_challenge'

describe Airport do
  it 'creates instance of airport' do
    airport = Airport.new
    expect(airport).to be_kind_of(Airport)
  end
  
  it 'allows plane to land' do
    airport = Airport.new
    expect(airport).to respond_to :land
  end
end
