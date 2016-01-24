require 'weather'

describe Weather do
  describe "#condition" do
    it "responds to condition" do
      expect(subject).to respond_to(:condition)
    end

    it "returns sunny or stormy when called" do
      expect(subject.condition).to satisfy {|s| ["sunny", "stormy"].include?(s)}
    end
  end
end