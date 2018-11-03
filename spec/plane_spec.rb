require "plane.rb"

describe Plane do
  it "checks the starting location for plane" do
    expect(Plane.new.location).to eq("Ground")
  end

  it "checks the planes name is 5 characters after create_name has run" do
    plane = Plane.new
    plane.name
    expect(plane.name.length).to eq 5
  end
  #
  # it "checks that the last two characters of the planes name are Integers" do
  #   plane = Plane.new
  #   plane.name
  #   expect(plane.name[3..5]).to eq ()
  # end

end
