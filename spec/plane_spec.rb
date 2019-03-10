require 'plane'

describe Plane do
  describe '#flying' do
    context "when it's initialized" do
      it "is true" do
        @plane = Plane.new
        expect(@plane.flying?).to eq true
      end
    end
  end
end
