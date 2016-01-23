require 'plane'

describe Plane do
  describe "#landed?" do
    
    it "responds to landed?" do
      expect(subject).to respond_to(:landed?)
    end

    it "returns true when landed? is called" do
      expect(subject.landed?).to eq true
    end

  end
end