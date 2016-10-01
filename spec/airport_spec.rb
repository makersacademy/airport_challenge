require 'airport'
describe Airport do
  describe "initialization" do
    it "defaults capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    it "can be set a different capacity" do
      expect(Airport.new(100).capacity).to eq 100
    end
  end
end
