# Feature Tests
require './lib/airport.rb'

airport = Airport.new
plane = Plane.new

## Test ->
def feature_test(expected_result, test_statement)
  if expected_result == test_statement
    p "Pass"
  else
    p "FAIL -> expected #{expected_result}, got #{test_statement}"
  end
end

# PRELIM CONDITIONS - It sets the weather to a !stormy state so that tests run
airport.instance_variable_set('@weather', 101)

# Initial state - shows no planes in airport
feature_test([], airport.landed_planes)

# 1 It instructs a plane to land
feature_test([plane], airport.land_plane(plane))

# 2 It shows whether a plane has landed or not (planes are to start in the sky)
feature_test("landed", plane.landing_status)

# 3 It shows the plane is now landed in the airport
feature_test([plane], airport.landed_planes)

# 4 It shows landed planes cannot take off in stormy conditions
airport.instance_variable_set('@weather', 0)
#    Unhash to test - fails all subsequent tests if run.
# airport.clear_plane(plane)
# feature_test("airborn", plane.landing_status)

# 5 It shows planes cannot land in stormy conditions
#    Unhash to test - fails all subsequent tests if run.
# airport.land_plane(plane)
# feature_test("landed", plane.landing_status)
airport.instance_variable_set('@weather', 101)

# 6 It instructs a plane to take off
airport.clear_plane(plane)
feature_test("airborn", plane.landing_status)

# 7 It shows the default capacity of the airport
feature_test(20, airport.capacity)

# 8 It allows the default capacity to be overridden
airport.override_capacity(21)
feature_test(21, airport.capacity)

# 9 It prevents planes from landing if the airport is over capacity (currently set at 21)
#    Unhash to test - fails all subsequent tests if run.
airport.capacity.times { airport.land_plane(Plane.new) }
# feature_test("Maintain holding pattern -> Airport at Capacity", airport.land_plane(plane))

# 10. It confirms all of the planes that are at the airport
15.times { airport.clear_plane(airport.landed_planes.last) }
p "Plane's currently landed at this airport:"
airport.landed_planes.each { |aeroplane| p aeroplane.to_s }
