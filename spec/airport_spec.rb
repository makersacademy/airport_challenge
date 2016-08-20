require "airport"
require "plane"

describe Airport do

  it "instructs plane to land" do
    plane = Plane.new
    expect(subject.instruct_land(plane)).to eq true
  end

end
 
