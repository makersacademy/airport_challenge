require './lib/plane.rb'
require './lib/airport.rb'

describe Plane do
  subject(:plane) { described_class.new }
  describe "#Plane Status" do
  it { is_expected.to respond_to :landed}
  it { is_expected.to respond_to :flying}
  it "checks that status_land changes status to landed" do
  expect(plane.landed).to eq "Landed"
end

      it "checks that status_takeoff changes status to takeoff" do
        expect(plane.flying).to eq "Flying"
    end
  end
end
