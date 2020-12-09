require 'Plane'

describe Plane do

  it "The first plane to be created has an ID of 1" do
    plane = Plane.new
    expect(plane.ID).to eq 1
  end

  it "Each plane has a unique ID" do
    plane_ids = []
    5.times { plane_ids << Plane.new.ID }
    # Create 5 planes and push their ids onto the array
    num_of_repeated_ids = plane_ids.count(plane_ids[0])
    # Count how many of the first ID in the list are in the array
    # Should be one
    expect(num_of_repeated_ids).to eq 1 
  end

end
