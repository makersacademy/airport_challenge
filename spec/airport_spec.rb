require 'airport'

describe Airport do
  airport = Airport.new
  it 'instructs plane to land at an airport' do
    # arrange
    plane = Plane.new
    # assert
    expect(airport.land(plane)).to eq [plane]
  end

  it 'instructs plane to take off from an airport' do
    # arrange
    plane = Plane.new
    # assert
    expect(airport.take_off).to eq "Confirmation, plane has left the airport."
  end

  it 'prevents landing when airport is full' do
    10.times { airport.land Plane.new }
    expect { airport.land Plane.new }.to raise_error 'Permission denied, airport at capacity.'
  end

    # Create a new airport with 30 and test
  it 'Allow user to set capacity of airport' do
    num = 30
    custom_airport = Airport.new(num)
    expect(custom_airport.capacity).to eq num

    # Create a default airport using the DEFAULT_CAPACITY constant
    airport = Airport.new
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end
end
