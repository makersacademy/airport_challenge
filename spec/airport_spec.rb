require './docs/airport_challenge'

describe Airport do
  it 'creates instance of airport' do
    airport = Airport.new(10)
    expect(airport).to be_kind_of(Airport)
  end
  
  # it 'allows plane to land' do
  #   airport = Airport.new
  #   expect(airport).to respond_to :land
  # end
  # not needed as it is fully covered by a future test

  it 'land takes 1 argument' do
    airport = Airport.new(10)
    expect(airport).to respond_to(:land).with(1).argument
  end

  it 'allows a plane to takeoff from airport' do
    airport = Airport.new(10)
    expect(airport).to respond_to(:takeoff).with(1).argument
  end 

  it 'raises error when landing at full airport' do
    airport = Airport.new(10)
    plane = Plane.new
    10.times do
      airport.land(plane)
    end
    expect { airport.land(plane) }.to raise_error 'Airport is full, cannot land plane'
  end
end
