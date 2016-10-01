require 'airport'
describe Airport do
  describe "initialization" do
    it "defaults capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end
end
