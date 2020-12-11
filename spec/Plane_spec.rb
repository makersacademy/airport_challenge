require 'Plane'

describe Plane do

  it "Each plane has a unique ID" do
    plane_ids = []
    10.times { plane_ids << Plane.new.object_id }
    # Create 10 planes and push their ids onto the array
    num_of_repeated_ids = plane_ids.count(plane_ids[0])
    # Count how many of the first ID in the list are in the array
    # Should be one
    expect(num_of_repeated_ids).to eq 1 
  end

end
