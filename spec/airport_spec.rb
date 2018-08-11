require 'airport'
require 'plane'

describe Airport do

  it { is_expected.to respond_to(:land).with(1).argument }

  it "should have somewhere to store instances of planes" do 
    expect(subject.planes).to eq([])
  end

  it "should land a plane" do 
    heathrow = Airport.new
    heathrow.land("BA123")
    expect(heathrow.planes[0].flight_number).to eq("BA123")
  end

  it { is_expected.to respond_to(:takeoff).with(1).argument }

  it "should remove given plane from airport when #takeoff is called" do
    heathrow = Airport.new
    heathrow.land("BA123")
    heathrow.takeoff("BA123")
    expect(heathrow.planes[0]).to eq nil 
  end

  it "should return a message to confirm takeoff" do
    heathrow = Airport.new
    expect(heathrow.confirm).to eq("Plane is no longer in the airport.")
  end

  it "should prevent landing when airport is full" do 
    heathrow = Airport.new
    heathrow.land("BA123")
    heathrow.land("BA878")
    heathrow.land("BA666")

    expect { heathrow.land("EZ456") }.to raise_error("Airport is full.")
  end

end
