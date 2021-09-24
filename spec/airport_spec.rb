require "airport"

RSpec.describe Airport do

  it "removes a plane from @parked when self.take_off" do
    heathrow = Airport.new(1)
    heathrow.land("easyjet")
    heathrow.take_off("easyjet")
    expect(heathrow.parked.length).to eq 0
  end

  it "confirms that plane is no longer in the airport after take off" do
    gatwick = Airport.new(2)
    gatwick.land("sleazyjet")
    expect(gatwick.take_off("sleazyjet")).to eq "sleazyjet no longer at airport"
  end

  it "confirms airport full if airport.parked >= @capacity" do
    jersey = Airport.new(0)
    expect(jersey.full?).to eq true
  end

  it "will prevent landing when the airport is full" do
    lax = Airport.new(0)
    expect{lax.land("lufthansa")}.to raise_error(RuntimeError)
  end

  it "will override airport capacity" do
    croydon = Airport.new(1)
    croydon.override_capacity(5)
    expect(croydon.capacity).to eq 5
  end

  it "prevents planes from taking off if weather == stormy" do
    city = Airport.new(50)
    city.weather_set("stormy")
    ryanair = Plane.new("Ryanair")
    expect(city.take_off(ryanair)).to eq "Weather unsafe for takeoff"
  end

end