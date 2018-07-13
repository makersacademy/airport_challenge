# die - do it expect

require 'airport.rb'

describe Airport do 
  it "airport.new creates a new airport" do
    expect(Airport.new).to be_instance_of Airport
  end 
end 
# user story 1 
# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport
