require 'plane'

describe Plane do
  let(:dummy_airport) {double :airport}
  let(:already_on_ground) {'Warning! Already landed.'}
  let(:already_in_air) {'Warning! Already in flight.'}

  describe "landing sequence: " do
    let(:subject) {Plane.new}

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
    let(:subject) {Plane.new(dummy_airport)}

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
    let(:subject) {Plane.new(dummy_airport)}

    it "is in a airport when landed" do
      expect(subject.stationed_at?).to eq dummy_airport
    end

    it "raises an exception if told to land while on the ground" do
      expect{subject.land(dummy_airport)}.to raise_error(already_on_ground)
    end

  end

  context "status consistency in the air:" do
    let(:subject) {Plane.new}

    it "is in no airport when flying" do
      expect(subject.stationed_at?).to eq nil
    end

    it "raises an exception if told to takeoff while in flight" do
      expect{subject.takeoff}.to raise_error(already_in_air)
    end

  end

end
