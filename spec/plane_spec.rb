require 'plane'
# requires the plane.rb file from lib

RSpec.describe "Plane" do
# tests looking at the Plane class
  it "checks if a plane can land" do
    # arrange
    my_plane = Plane.new("","")
  
    # act
    my_plane.land
  
    # assert
    expect(my_plane.land).to eq true 
  end

  it "checks if a plane must not land" do
    # arrange
    my_plane = Plane.new("","")
  
    # act
    my_plane.do_not_land
  
    # assert
    expect(my_plane.do_not_land).to eq true 
  end

  it "checks if a plane can takeoff" do
    # arrange
    my_plane = Plane.new("","")

    # act
    my_plane.takeoff

    # assert
    expect(my_plane.takeoff).to eq true
  end

  it "checks if a plane must not takeoff" do
    # arrange
    my_plane = Plane.new("","")
  
    # act
    my_plane.do_not_takeoff
  
    # assert
    expect(my_plane.do_not_takeoff).to eq true 
  end

  it "checks a plane's ID number" do

    # arrange
    my_plane = Plane.new("PL001","")
  
    # act
  
    # assert
    expect(my_plane.check_id).to eq "PL001" 
  end

  it "checks a plane's location" do

    # arrange
    my_plane_a = Plane.new("","sky")
    my_plane_b = Plane.new("","airport")

    # act
  
    # assert
    expect(my_plane_a.check_location).to eq "sky"
    expect(my_plane_b.check_location).to eq "airport"
  end

end
