require 'capybara/rspec'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

# Note that we're going to stub out weather checks to give predictable results

feature 'Grand Finale' do

  scenario 'all planes can land and all planes can take off' do

    # Create an empty airport with capacity for 6 planes
    airport = Airport.new 6
    
    #Stub weather to sunny - not testing in this feature
    allow(airport).to receive(:weather_check).and_return(:sunny)

    # Create 6 planes and land them at the airport, each in turn
    planes = []

    #allow(catford).to receive(:another_method).and_return(true))
    #THIS IS CALLED STUBBING AND COULD BE HANDY FOR WEATHER

    6.times do
      planes << Plane.new
    end

    planes.each do |plane|
      plane.land airport
    end

    # Check that each of the 6 planes is landed
    planes.each do |plane|
      expect( plane ).not_to be_flying
    end

    # Launch all 6 planes
    planes.each do |plane|
      plane.launch
    end

    # Check that each of the 6 planes is flying
    planes.each do |plane|
      expect( plane ).to be_flying
    end
  end
end
