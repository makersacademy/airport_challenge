require "./lib/airport"

describe "FEATURE TEST" do

  subject(:plane) {Plane.new}
  subject(:airport) {Airport.new}
  let(:small_airport){Airport.new(1)}
   it "lands a plane at the airport and checks it has landed" do
    allow(Weather).to receive(:weather?).and_return(false)

  airport.land(plane)
  expect(plane.landed).to be true

  end
  it "can take off from an airport and confirm it is no longer there" do
    allow(Weather).to receive(:weather?).and_return(false)
    airport.take_off(plane)
    expect(plane.landed).to be false
  end
  context "stormy weather" do
    before{allow(Weather).to receive(:weather?).and_return(true)}
      it "plane does not take off in stormy weather" do
        expect{airport.take_off(plane)}.to raise_error "can't fly win storm"
       end
      it "plane does not land in stormy weather" do
        expect{airport.land(plane)}.to raise_error
      end
    end
    it "prevents a landing when airports are full" do
      small_airport.land(plane)
      expect{small_airport.land(plane)}.to raise_error
    end
end