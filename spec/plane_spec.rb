require "plane"
describe Plane do
  let(:airport) {double :airport}
  describe("#land") do
    it{is_expected.to respond_to(:land).with(1).argument}
  end
  describe("#landed?") do
    it{is_expected.to respond_to :landed?}
    it{is_expected.to be_landed}
    it "is expected to not be landed after taking off" do
      subject.take_off
      is_expected.not_to be_landed
    end
  end
  describe("#take_off") do
    it{is_expected.to respond_to :take_off}
  end
end
