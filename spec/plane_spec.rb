require 'plane'
# requires the plane.rb file from lib

RSpec.describe "Plane" do
# tests looking at the Plane class
  it "checks if a plane can land" do
    # arrange
    my_plane = Plane.new
  
    # act
    my_plane.land
  
    # assert
    expect(my_plane.land).to eq true 
  end

  it "checks if a plane can takeoff" do
    # arrange
    my_plane = Plane.new

    # act
    my_plane.takeoff

    # assert
    expect(my_plane.takeoff).to eq true
  end
end
