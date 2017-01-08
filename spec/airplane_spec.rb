require 'airplane'

subject(:airplane) {Airplane.new}

describe ".land" do

  context "Airplane is in flight" do
    it { is_expected.to respond_to(:land)}
    describe "Confirms the Airplane has landed" do
      expect(plane.land).to eq "Airplane has landed"

    end
  end

  context "Plane is not in flight" do
  subject(:plane) { Airplane.new(false) }
    describe "Airplane Can't land when landed" do
        expect {airplane.land}.to raise_error(RuntimeError, "Can't land already ladded")
    end
  end
end


describe ".take_off" do

  context ".take_off" do
    describe "plane is in flight" do
      it "cannot take off if already in flight" do
         expect {plane.take_off}.to raise_error(RuntimeError, "Can't take off, already in flight")
      end
    end
  end


  context "plane is not in flight" do
  subject(:airplane) { Airplane.new(false) }
    it "can be instructed to take off" do
        expect(plane).to respond_to(:take_off)
    end

      it "confirms sucsessful take off" do
        expect(plane.take_off).to eq "Airplane has taken off"
      end
  end

end
