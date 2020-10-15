# this is the test file for checking Class object availability
# inteded to make sure that the "world" and "objects" are present
# a bit like a board setup check for chess

# checking file structure - update as needed during world creation
require 'class_plane'
require 'class_airport'
require 'software_airport'

# checking core class availability
RSpec.describe Airport do
  it "- checking if an airport can be created" do
    airport = Airport.new('Test')
    expect(airport).to_not eq(nil)
  end
end

RSpec.describe Plane do
  it "- checking if a plane can be created" do
    expect(subject).to_not eq(nil)
  end
end
