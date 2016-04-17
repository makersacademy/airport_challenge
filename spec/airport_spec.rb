require 'airport'

describe Airport do

context "Landing and Takeoff" do

subject(:airport){ described_class.new }
let (:airplane){ double :airplane }

  it "allows airplanes to land" do
     is_expected.to respond_to :land
  end

  it "allows airplanes to takeoff" do
     is_expected.to respond_to :takeoff
  end

  it "knows which planes are visiting" do
    airport.land(airplane)
    expect(airport.tarmac).to include airplane
  end

  it "does not include airplanes that have taken off" do
    airport.land(airplane)
    airport.takeoff(airplane)
    expect(airport.tarmac).to_not include airplane
  end

end
end
