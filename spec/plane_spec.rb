require 'plane'

describe Plane do

describe "#status" do
  plane = Plane.new
  airport = Airport.new

  it { is_expected.to respond_to(:status) }
  context "when flying" do
    it "is expected to confirm that plane is flying" do
      expect(plane.status).to eq "The plane is flying"
    end
  end

  context "when on the ground" do
    it "is expected to confirm that the plane has landed" do
      airport.arrive(plane)
      expect(plane.status).to eq "The plane has landed"
    end
  end
end


  describe "Landing Tests:" do
    plane = Plane.new
    airport = Airport.new
    airport.arrive(plane)
    it { is_expected.to respond_to(:land_plane)}
    it { is_expected.to respond_to(:landed?)}

    context "when plane is flying and is instructed to land" do
      it "sets @landed to true" do
        expect(plane.landed).to eq true
      end
      it "confirms to ATC that it has landed" do
      expect(plane).to be_landed
      end
    end

    context "when plane is already on the ground and is instructed to land" do
      plane.landed == true
      it "raises an error if asked to land when the plane is already on the ground" do
        expect {plane.land_plane}.to raise_error(RuntimeError, "The plane is already on the ground!")
      end
    end
  end

  describe "Take-Off Tests:" do
    plane = Plane.new
    airport = Airport.new
    airport.arrive(plane)

    it { is_expected.to respond_to(:take_off) }
    it { is_expected.to respond_to(:departed?) }

    context "when plane is at airport" do
      it "calling departed? shows that plane has departed airport" do
        airport.depart(plane)
        expect(plane.landed).to eq false
      end
    end

    context "when plane is already flying" do
      it "raises an error if asked to take-off when the plane is already in the air" do
        expect{plane.take_off}.to raise_error(RuntimeError, "The plane is already in the air!")
      end
    end
  end
end
