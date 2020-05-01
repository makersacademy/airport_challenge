require 'airport'
describe Airport do
  subject(:airport) {described_class.new}

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport

  it "instructs planes to land at an airport" do
    #arrange
    plane = Plane.new
    airport = Airport.new

    # act
    plane.land(airport)
    airport.inventory

    #assert
    expect(airport.inventory.length).to be(1)
    end

    #As an air traffic controller
    # So I can get passengers on the way to their destination
    # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

    it "instructs planes to take off from an airport and confirms this" do
      #arrange
      plane = Plane.new
      airport = Airport.new

      #act
      plane.take_off(airport)
      airport.inventory

      #assert
      expect(airport.inventory.length).to be(0)
    end
end
