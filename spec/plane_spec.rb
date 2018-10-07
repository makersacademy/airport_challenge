require 'plane.rb'

describe Plane do
  it { is_expected.to respond_to :flying?}

      describe "#land" do
      it "can land a plane" do
        subject.land
        expect(subject.flying?).to be false
      end
    end

    describe "#takeoff" do
    it "can takeoff a plane" do
      subject.takeoff
      expect(subject.flying?).to be true
    end
  end
end
