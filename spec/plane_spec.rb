require 'plane'

describe Plane do 

  it "should expect #flight_number to not be empty" do 
    jumbo = Plane.new("BA723")
    expect(jumbo.flight_number).not_to eq(nil)
  end 

end
