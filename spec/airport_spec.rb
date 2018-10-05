require "./lib/airport.rb"

describe Airport do
let(:plane1) {double :plane1}

  it "allows a plane to land if there is capacity" do
    allow(plane1).to receive(:land).and_return(true)
    allow(subject).to receive(:setweather) { 'sunny'}
    expect(subject.allowland(plane1)).to eq(true)
  end

  it "prevents a plane to land if there is NO capacity" do
    plane1 = double
    plane2 = double
    plane3 = double
    allow(plane1).to receive(:land).and_return(true)
    allow(plane2).to receive(:land).and_return(true)
    allow(plane3).to receive(:land).and_return(true)
    allow(subject).to receive(:setweather) { 'sunny'}
    airport = Airport.new("London",2)
    airport.allowland(plane1)
    airport.allowland(plane2)
    expect{airport.allowland(plane3)}.to raise_error("Cant land; NO capacity")
  end

  it "allows a plane to takeoff if it is at that airport" do
    allow(plane1).to receive(:land).and_return(true)
    allow(plane1).to receive(:takeoff).and_return(true)
    destination = Airport.new("Morocco")
    allow(subject).to receive(:setweather) { 'sunny'}
    subject.allowland(plane1)
    expect(subject.allowtakeoff(plane1,destination)).to eq(true)
  end

  it "does NOT allows a plane to takeoff if it is NOT that airport" do
    allow(plane1).to receive(:takeoff).and_return(true)
    allow(subject).to receive(:setweather) { 'sunny'}
    destination = Airport.new("Morocco")
    expect{subject.allowtakeoff(plane1,destination)}.to raise_error "The plane isnt here!"
  end

  it "returns current traffic at airport" do
    expect(subject.gettraffic).to eq(0)
  end

  it "lands a plane on sunny weather" do
    allow(plane1).to receive(:land).and_return(true)
    allow(subject).to receive(:setweather) { 'sunny'}
    expect(subject.allowland(plane1)).to eq(true)
  end

  it "does NOT land a plane on stormy weather" do
    allow(plane1).to receive(:land).and_return(true)
    allow(subject).to receive(:setweather) { 'stormy'}
    expect{subject.allowland(plane1)}.to raise_error("Bad weather; no landing")
  end

  it "allows a plane to take off from at airport towards speficified destination on sunny weather" do
    allow(plane1).to receive(:takeoff).and_return(true)
    allow(plane1).to receive(:land).and_return(true)
    allow(subject).to receive(:setweather) { 'sunny'}
    destination = Airport.new("Morocco")
    subject.allowland(plane1)
    allow(subject).to receive(:setweather) { 'sunny'}
    expect(subject.allowtakeoff(plane1,destination)).to eq(true)
  end

  it "does NOT allow a plane to take off from airport towards speficified destination on stormy weather" do
    allow(plane1).to receive(:takeoff).and_return(true)
    allow(plane1).to receive(:land).and_return(true)
    destination = Airport.new("Morocco")
    allow(subject).to receive(:setweather) { 'sunny'}
    subject.allowland(plane1)
    allow(subject).to receive(:setweather) { 'stormy'}
    expect{subject.allowtakeoff(plane1,destination)}.to raise_error("Bad weather; no takeoff")
  end

end
