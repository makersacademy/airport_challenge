require "airport.rb"

describe Airport do
  it { is_expected.to respond_to :land }

  it "instructs plane to land" do
    # creates an instances of the plane and airport classes
    boeing_727 = Plane.new
    heathrow = Airport.new
    # the heathrow instance of airport, sends a 'land' message to the plane object
    heathrow.land(boeing_727)
    # expect that planes property from airport object, includes boeing_727
    # planes is a property of the object heathrow (access the property/ methods by using .(dot))
    expect(heathrow.planes).to include(boeing_727)
  end

  it "instructs plane to take off" do
    # arrange
    boeing_727 = Plane.new
    heathrow = Airport.new
    # act/method: airport instructs plane to take off, and prints to screen
    heathrow.planes << boeing_727
    heathrow.take_off(boeing_727)
    # expect that boeing_727, is removed from planes property in the airport object
    expect(heathrow.planes).not_to include(boeing_727)
  end

  it "prevents plane landing when airport full" do
    # arrange
    heathrow = Airport.new
    # act/method: airport tells plane it is at 100/ full capacity so no planes landing
    default_capacity = "100"
    # Expect 'plane cannot land' warning if at full capacity
    expect(heathrow.full_capacity(default_capacity)).to eq("100")
    # expect(heathrow.full_capacity(current_capacity)).to output.to_stdout "WARNING: Airport at full capcacity, plane cannot land"
  end

  # it "initialized with a default capacity of 50" do
  #   # arrange
  #   heathrow = Airport.new
  #   # act/method:
  #   heathrow.initialize.default_capacity = "50"
  #   # Expect
  #   # heathrow.initialize.default_capacity.to eq("50")
  # end
end
