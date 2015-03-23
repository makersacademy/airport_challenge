require 'airport'

<<<<<<< HEAD
## Note these are just some guidelines!
## Feel free to write more tests!!

# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport
# and how that is implemented.
#
# If the airport is full then no planes can land

=======
>>>>>>> 596954af958e6a8e8a7a3a654ef5e5530983f27d
describe Airport do
  let (:plane) { double :plane, flying?: true, land!: nil }
  let (:airport) { Airport.new }

  it 'should be empty when created' do
    expect(airport.planes.length).to eq 0 
  end

  it 'allows a plane to land' do
    airport.land(plane)
    expect(airport.planes.length).to eq 1
  end

  it 'the plane is notified that it has landed' do
    
  end
<<<<<<< HEAD
end
=======
end
>>>>>>> 596954af958e6a8e8a7a3a654ef5e5530983f27d
