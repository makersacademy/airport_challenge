require 'plane'

describe Plane do
  let(:subject) {Plane.new}
  let(:dummy_airport) {double :airport, land_airplane: nil}
  let(:already_on_ground) {'Warning! Already landed.'}
  let(:already_in_air) {'Warning! Already in flight.'}

  describe "initalize method:" do

    it "can be created on the ground" do
      expect(dummy_airport).to receive :land_airplane
      Plane.new dummy_airport
    end

    it "can be created in flight" do
      subject = Plane.new
      expect(subject.airborne?).to eq true
    end

  end

  describe "landing sequence: " do

    it "can be verified as landed" do
      subject.land(dummy_airport)
      expect(subject.airborne?).to eq false
    end

    it "is stationed at an airport once landed" do
      subject.land(dummy_airport)
      expect(subject.stationed_at?).to eq dummy_airport
    end

  end

  describe "takeoff sequence:" do
    before(:each) {subject.land(dummy_airport)}

    it "can be verified as departed" do
      subject.takeoff
      expect(subject.airborne?).to eq true
    end

    it "is not stationed at an airport once departed" do
      subject.takeoff
      expect(subject.stationed_at?).to eq nil
    end

  end

  context "status consistency on the ground:" do

    it "is in a airport when landed" do
      subject.land(dummy_airport)
      expect(subject.stationed_at?).to eq dummy_airport
    end

    it "raises an exception if told to land while on the ground" do
      subject.land(dummy_airport)
      expect{subject.land(dummy_airport)}.to raise_error already_on_ground
    end

  end

  context "status consistency in the air:" do

    it "is in no airport when flying" do
      expect(subject.stationed_at?).to eq nil
    end

    it "raises an exception if told to takeoff while in flight" do
      expect{subject.takeoff}.to raise_error already_in_air
    end

  end

end
