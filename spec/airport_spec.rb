require 'airport'
require 'plane'

describe Airport do

  it { is_expected.to respond_to(:land) }

  it { is_expected.to respond_to(:land).with(1).argument }

  it "should have somewhere to store instances of planes" do 
    expect(subject.planes).to eq([])
  end

  it "should land a plane" do 
    heathrow = Airport.new
    heathrow.land("BA123")
    expect(heathrow.planes[0].flight_number).to eq("BA123")
  end

end
