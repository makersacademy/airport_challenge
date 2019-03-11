require 'plane'

describe Plane do
  before :each do
    @plane = Plane.new
  end

  describe '#flying' do
    context "when it's initialized" do
      it "is true" do
        expect(@plane.flying?).to eq true
      end
    end
  end

  describe '#land' do
    context "plane is flying" do
      it "sets flying status to false" do
        @plane.land
        expect(@plane.flying?).to eq false
      end
    end

    context "plane is not flying" do
      before :each do
        @plane.land
      end

      it "raises an error" do
        expect { @plane.land }.to raise_error("That plane is not flying.")
      end
      # also test that @plane.flying == false here?
    end
  end

  describe '#take_off' do
    context "plane is not flying" do
      before :each do
        @plane.land
      end
      
      it "sets flying status to true" do
        @plane.take_off
        expect(@plane.flying?).to eq true
      end
    end

    context "plane is flying" do
      it "raises an error" do
        expect { @plane.take_off }.to raise_error("That plane is flying.")
      end
    end
  end
end
