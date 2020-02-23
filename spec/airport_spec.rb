  require "airport"
  
describe Airport do
let (:airplane) {double :airplane, :landed= => false, landed?: false}

  it "there are no planes" do
    expect(subject.planes).to eq []
  end

  it "land a plane and take off if there are no storms" do
    airplane = Airplane.new
    subject.storms = false
    allow(airplane).to receive(:landed).and_return(false)
    subject.land_plane(airplane)
    subject.storms = true
    allow(airplane).to receive(:landed). and_return(true)
    expect(subject.takeoff_plane(airplane)).to raise_error("There is a storm coming Mr. Wayne")
  end
end

describe Airplane do
  it "is there a new plane?" do
    expect(subject.landed).to eq true
  end
end