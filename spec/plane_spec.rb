require "./lib/plane.rb"

describe Plane do

  let (:airport) {double :airport}

  it "cannot land if it is not flying" do
    allow(airport).to receive(:allowland).and_return(true)
    allow(airport).to receive(:allowtakeoff).and_return(true)
    allow(airport).to receive(:setweather) { 'sunny'}
    subject.takeoff(airport)
    subject.land(airport)
    expect{subject.land(airport)}.to raise_error("Already landed; Cant do it twice!")
  end

  it "cannot take off if it is already flying" do
    allow(airport).to receive(:allowtakeoff).and_return("flying")
    allow(airport).to receive(:setweather) { 'sunny'}
    subject.takeoff(airport)
    expect{subject.takeoff(airport)}.to raise_error("Already flying; Cant takeoff again!")
  end

end
