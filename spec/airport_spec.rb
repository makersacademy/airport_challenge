  require "airport"
  
  describe Airport do
  let (:plane) {double :airplane, :landed= => false, landed?: false}

  it "there are no planes" do
    expect(subject.planes).to eq []
  end

  it "land a plane and take off" do
    airplane = Airplane.new
    allow(airplane).to receive(:landed).and_return(false)
    subject.land_plane(airplane)
    allow(airplane).to receive(:landed). and_return(true)
    expect(subject.takeoff_plane(airplane)).to eq airplane
  end
end

describe Airplane do
  it "is there a new plane?" do
    expect(subject.landed).to eq true
  end
end