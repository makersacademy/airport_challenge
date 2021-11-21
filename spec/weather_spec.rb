require 'weather'

describe Weather do
  let(:subject) { Weather.new }
  
  describe "#now?" do
    it "calls rand and returns stormy" do
      allow(subject).to receive(:rand).and_return(3)
      expect(subject.now?).to eq :stormy
    end

    it "calls rand and returns sunny" do
      allow(subject).to receive(:rand).and_return(2)
      expect(subject.now?).to eq :sunny
    end
  end

end
