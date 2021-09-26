require "airport"

describe Airport do
  describe "#land" do
    it "responds to land command" do
      expect(subject).to respond_to(:land)
    end
  end
end
