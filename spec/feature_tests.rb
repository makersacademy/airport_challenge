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

# It instructs a plane to land
feature_test([plane], airport.land_plane(plane))

# It shows whether a plane has landed or not (planes are to start in the sky)
feature_test(false, plane.landed?)

# It shows a plane landed after being instructed to
airport.land_plane(plane)
feature_test(true, plane.landed?)
