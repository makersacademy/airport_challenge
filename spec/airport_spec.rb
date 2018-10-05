require "./lib/airport.rb"

describe Airport do
let(:plane1) {double :plane1}
  it "allows a plane to land if there is capacity" do
    expect(subject.addtraffic(plane1)).to eq(true)
  end

  it "prevents a plane to land if there is NO capacity" do
    plane1 = double
    plane2 = double
    plane3 = double
    allow(plane1).to receive(:land).and_return(true)
    allow(plane2).to receive(:land).and_return(true)
    #allow(plane3).to receive(:land).and_return()
    airport = Airport.new(2)
    airport.addtraffic(plane1)
    airport.addtraffic(plane2)
    expect{airport.addtraffic(plane3)}.to raise_error("Cant land; NO capacity")
  end

  it "allows a plane to takeoff" do
    expect(subject.reducetraffic(plane1)).to eq(true)
  end

end
