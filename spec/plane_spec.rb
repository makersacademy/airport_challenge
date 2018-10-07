require 'plane.rb'

describe Plane do
  it { is_expected.to respond_to :flying?}

      describe "#land" do
      it "can land a plane" do
        subject.landed
        expect(subject.flying?).to be false
      end
    end

    describe "#takeoff" do
    it "can takeoff a plane" do
      subject.takenoff
      expect(subject.flying?).to be true
    end
  end
end
