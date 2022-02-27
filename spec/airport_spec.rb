require './lib/airport'

describe Airport do
  let(:plane) { double("plane") }

  it { is_expected.to respond_to(:receive) }

  describe "#receive" do
    it "returns true when plane has been received" do
      expect(subject.receive(plane)).to eq true
    end
  end

  
  
end