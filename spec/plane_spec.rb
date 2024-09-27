require 'plane'
# requires the plane.rb file from lib

RSpec.describe "Plane" do
# tests looking at the Plane class

  it "checks if a plane can land" do
    # arrange, act, assert
    my_plane = Plane.new("","")
    expect(my_plane.land).to eq true 
  end

  it "checks if a plane must not land" do
    my_plane = Plane.new("","")
    expect(my_plane.do_not_land).to eq true 
  end

  it "checks if a plane can takeoff" do
    my_plane = Plane.new("","")
    expect(my_plane.takeoff).to eq true
  end

  it "checks if a plane must not takeoff" do
    my_plane = Plane.new("","")
    expect(my_plane.do_not_takeoff).to eq true 
  end

  it "checks a plane's ID number" do
    my_plane = Plane.new("PL001","")
    expect(my_plane.check_id).to eq "PL001" 
  end

  it "checks a plane's location" do
    # arrange
    my_plane_a = Plane.new("","sky")
    my_plane_b = Plane.new("","airport")

    # act, assert
    expect(my_plane_a.check_location).to eq "sky"
    expect(my_plane_b.check_location).to eq "airport"
  end

end
