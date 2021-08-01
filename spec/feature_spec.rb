require 'airport'

describe "Airport feature testing (without random weather)" do

  it "Takes off and lands a number of planes" do
    p "Create our airport: #{heathrow = Airport.new}"
    allow(heathrow.weather).to receive(:stormy?) { false }
    p "Create our first plane: #{airbus_a380 = Plane.new}"
    p "Land our first plane: #{heathrow.land(airbus_a380)}"
    p "Check first plane is now at airport: #{heathrow.contains?(airbus_a380)}"
    p "Check first plane is in the hangar: #{heathrow.hangar}"
    p "Create our second plane: #{boeing_777 = Plane.new}"
    p "Land our second plane: #{heathrow.land(boeing_777)}"
    p "Check hangar contains first and second planes: #{heathrow.hangar}"
    p "First plane takes off: #{heathrow.take_off(airbus_a380)}"
    p "Check airport no longer contains first plane (should be false): #{heathrow.contains?(airbus_a380)}"
    p "Check hangar only contains second plane: #{heathrow.hangar}"
    p "Create our third plane: #{wright_flyer = Plane.new}"
    p "Land our third plane: #{heathrow.land(wright_flyer)}"
    p "Check hangar contains second and third planes: #{heathrow.hangar}"
    p "Land first plane again: #{heathrow.land(airbus_a380)}"
    p "Check hangar contains all three planes: #{heathrow.hangar}"
    p "Take off third plane: #{heathrow.take_off(wright_flyer)}"
    p "Take off second plane: #{heathrow.take_off(boeing_777)}"
    p "Land third plane: #{heathrow.land(wright_flyer)}"
    p "Check first plane is at the airport: #{heathrow.contains?(airbus_a380)}"
    p "Check second plane isn't at the airport: #{heathrow.contains?(boeing_777)}"
    p "Check third plane is at the airport (should be false): #{heathrow.contains?(wright_flyer)}"
    p "Check hangar to see first and third planes: #{heathrow.hangar}"
  end

end
