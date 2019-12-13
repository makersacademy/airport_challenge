# User Stories:
# *I want to instruct a plane to land at an airport
# *I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
# *I want to prevent landing when the airport is full

require Airport

describe Airport.new do
  to 'creates an instance of Airport' do
    expect(airport).to be_kind_of(Airport)
  end
end
