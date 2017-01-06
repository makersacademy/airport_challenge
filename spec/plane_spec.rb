require "plane"
describe Plane do
  let(:airport) {double :airport}
  context "on the ground" do
    describe("#land") do
      it{is_expected.to respond_to(:land).with(1).argument}
    end
    describe("#landed?") do
      it{is_expected.to respond_to :landed?}
      it{is_expected.to be_landed}
    end
    describe("#take_off") do
      it{is_expected.to respond_to :take_off}
    end
  end

  context "in the air" do
    before(:each) do
      subject.take_off
    end
    describe("#land") do
      it "is expected to land when asked" do
        subject.land airport
        is_expected.to be_landed
      end
    end
    describe("#landed?") do
      it{is_expected.not_to be_landed}
    end
  end
end
