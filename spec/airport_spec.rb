require 'airport'

RSpec.describe Airport do
  describe "#land" do
    it "should tell a plane to land" do
      expect(subject).to respond_to(:land).with(1).argument
    end
  end
end