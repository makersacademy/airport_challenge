require 'plane'
require 'airport'

describe Plane do

  subject(:plane) {described_class.new}
  let(:airport) { double(:airport) }

  it { is_expected.to respond_to :landed? }

  describe '#landing' do
    it "lands when instructed to land" do
      plane = Plane.new
      plane.land
      expect(plane.landed?).to eq true
    end
  end

  # describe "#takeoff" do
  #   it "takes off when instructed to take off"
  #   plane = Plane.new
  #   plane.land
  #   plane.takeoff
  #   expect(plane.landed?).to eq false
  # end

end
