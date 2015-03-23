require 'plane'

<<<<<<< HEAD
<<<<<<< HEAD
## Note these are just some guidelines!
## Feel free to write more tests!!

# When we create a new plane, it should have a "flying" status,
# thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should
# have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status
# should become "flying"

=======
>>>>>>> 596954af958e6a8e8a7a3a654ef5e5530983f27d
describe Plane do
  plane = Plane.new

  it 'should be flying when it is created' do
    expect(plane).to be_flying
  end

  it 'should be able to land' do
    plane.land!
    expect(plane).not_to be_flying    
  end

end
