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

# It shows whether a plane has landed or not
feature_test(false, plane.landed?)
