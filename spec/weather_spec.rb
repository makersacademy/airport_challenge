require 'weather'

describe Weather do
  let(:mockDie) { double :die, :die => "die" }

  describe "#stormy?" do
    it ".stormy? - Weather class responds to this method" do
      expect(subject).to respond_to :stormy?
    end
    it ".stormy? - returns true if it is stormy" do
      allow(mockDie).to receive(:roll) { 6 }
      expect(subject.stormy?(mockDie.roll)).to eq(true)
    end
  end

end
