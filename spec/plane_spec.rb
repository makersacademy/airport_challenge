require "plane"
describe Plane do
  let(:airport) {double :airport}
  describe("#land") do
    it{is_expected.to respond_to(:land).with(1).argument}
  end
  #describe(
end
