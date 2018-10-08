require "./lib/plane.rb"

describe Plane do

  let (:airport) {double :airport}
  let(:weather) {double :weather}

  before(:each) do
    allow(weather).to receive(:set_weather).and_return('sunny')
    allow(airport).to receive(:allowland).and_return(true)
    allow(airport).to receive(:allowtakeoff).and_return(true)
  end

  context "When testing Object state for CLASS: Plane" do
    it "cannot land if it is not flying" do
      subject.land(airport)
      expect{subject.land(airport)}.to raise_error("Already landed; Cant do it twice!")
    end

    it "cannot take off if it is already flying" do
      expect{subject.takeoff(airport)}.to raise_error("Already flying; Cant takeoff again!")
    end

  end

end
