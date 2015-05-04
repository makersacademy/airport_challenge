# Unit tests (planes):

# - New plane can be created
# - Plane is created with status 'flying', and location 'mid-air'
# - Plane status changes to 'landed' when landed, location changes to 'in-hangar'
# - Plane can land/take-off from airport
# - Plane cannot land when airport is full
# - Plane cannot land/take-off unless weather is 'sunny'
# - Responds to land request, unless landed
# - Responds to take-off, unless flying

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
require 'plane'

describe Plane do

  # it { is_expected.to respond_to :flying? }

  # it { is_expected.to respond_to :plane_status }


  xit 'has a flying status when in the air'

  xit 'can take off'

  xit 'changes its status to flying after taking off'

end