# this file is made to test feature tests, as if in irb
describe 'user_stories' do # US = user story
    # US1 As an air traffic controller 
    # US1 So I can get passengers to a destination 
    # US1 I want to instruct a plane to land at an airport
  it 'planes land at airport, airport instructs plane to land' do
    airport = Airport.new(10) # Airport will give instructions to plane, argument '10' refers to US3
    plane = Plane.new # Plane gets instructions from airport and executes
    expect { airport.land(plane) }.not_to raise_error 
    # US1 method 'land on 'airport with argument 'plane
  end
    # US2 As an air traffic controller 
    # US2 So I can get passengers on the way to their destination 
    # US2 I want to instruct a plane to take off from an airport and 
  it 'plane takes off, airport instructs plane to take off' do
    airport = Airport.new(10) # argument '10' refers to US3
    plane = Plane.new
    expect { airport.take_off(plane) }.not_to raise_error
  end
    # US2 confirm that it is no longer in the airport
  it 'plane confirms that is no longer in the airport' do
    plane = Plane.new
    expect { plane.confirm }.not_to raise_error
  end
    # US3 As an air traffic controller 
    # US3 To ensure safety 
    # US3 I want to prevent landing when the airport is full 
  it 'plane does not land when airport is full' do
    airport = Airport.new(10) # giving example capacity to the airport to create the condition 'full'
    plane = Plane.new         
    10.times do # filling the airport to its fullest
      airport.land(plane) # landing 10 planes to fill it up and meet condition 'full;
    end
    expect { airport.land(plane) }.to raise_error 'Airport full, no more planes allowed'
    # when condition 'full' is achieved, planes cannot land and will throw the message 
  end
end
