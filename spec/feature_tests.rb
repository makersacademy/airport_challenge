# Feature Tests

require './lib/airport.rb'

airport = Airport.new

# It instructs a plane to land
feature_test("plane landed", airport.land_plane)

## Test ->
def feature_test(expected_result, test_statement)
  if expected_result == test_statement
    p "Pass"
  else
    p "FAIL -> expected #{expected_result}, got #{test_statement}"
  end
end
