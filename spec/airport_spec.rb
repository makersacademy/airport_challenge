require "airport"

describe Airport do
  describe "#land" do
    it { is_expected.to respond_to(:land) }

    it "responds to land command with 1 argument" do
      expect(subject).to respond_to(:land).with(1).argument
    end
  end
end
