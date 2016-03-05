require "airport"

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe "#land" do

    it "brings the plane to land" do
      allow(plane).to receive(:land)
      subject.land plane
      expect(subject.planes.last).to eq plane
    end


  end

end
