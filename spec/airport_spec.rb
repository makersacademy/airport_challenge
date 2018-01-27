require 'airport'

describe Airport do
  it {is_expected.to respond_to(:land).with(1).argument}

  describe "#land" do
    let(:plane) { double("a plane") }
    it "returns plane when when landed" do
      expect(subject.land(plane)).to include plane
    end
  end

end
