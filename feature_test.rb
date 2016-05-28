require_relative './lib/plane.rb'    # => true
require_relative './lib/airport.rb'  # => false

geneva = Airport.new  # ~> NameError: uninitialized constant Geneva

# ~> NameError
# ~> uninitialized constant Geneva
# ~>
# ~> /Users/sdawes/Documents/projects/airport_challenge/feature_test.rb:4:in `<main>'
