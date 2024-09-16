require "airport"

RSpec.describe Airport do

  it "removes a plane from @parked when self.take_off" do
    subject.take_off("easyjet")
    expect(subject.parked.length).to eq 0
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
    subject.override_capacity(5)
    expect(subject.capacity).to eq 5
  end

  it "prevents planes from taking off if weather == stormy" do
    subject.weather_set("stormy")
    expect(subject.take_off("ryanair")).to eq "Weather unsafe for takeoff"
  end

  it "prevents planes from landing if weather == stormy" do
    subject.weather_set("stormy")
    expect(subject.land("aeroflot")).to eq "Weather unsafe for landing"
  end

end