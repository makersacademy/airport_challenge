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

# 1 It instructs a plane to land
# feature_test([plane], airport.land_plane(plane))

# 2 It shows whether a plane has landed or not (planes are to start in the sky)
# expect to fail if first test is run
feature_test("airborn", plane.landing_status)

# 3 It shows a plane landed after being instructed to
airport.land_plane(plane)
feature_test("landed", plane.landing_status)

# 4 It shows landed planes
feature_test([plane], airport.landed_planes)

# 5 It instructs a plane to take off
feature_test([], airport.clear_plane(plane))

# 6 It shows whether a plane has taken off after being cleared
airport.clear_plane(plane)
feature_test("airborn", plane.landing_status)
