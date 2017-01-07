require "plane.rb"

describe Plane do

  subject(:plane) { Plane.new }

  describe ".land" do

    context "plane is airborne" do
      it { is_expected.to respond_to(:land) }
      it "confirms it has landed" do
        expect(plane.land).to eq "Plane has landed"
      end
    end

    context "plane is not airborne" do
      subject(:plane) { Plane.new(false) }
      it "cannot land if airborne" do
        expect {plane.land}.to raise_error(RuntimeError, "Cannot land - already landed!")
      end
    end

  end

  describe ".take_off" do

    context "plane is airborne" do
      it "cannot take off if already airborne" do
        expect {plane.take_off}.to raise_error(RuntimeError, "Cannot take off - already airborne!")
      end
    end

    context "plane is not airborne" do
      subject(:plane) { Plane.new(false) }
      it "can be instructed to take off" do
        expect(plane).to respond_to(:take_off)
      end
      it "confirms it has taken off" do
        expect(plane.take_off).to eq "Plane has taken off"
      end
    end


  end

end
