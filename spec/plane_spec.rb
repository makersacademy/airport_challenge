require "plane"

describe Plane do

  describe 'working?' do
    it "accepts 0 argument" do
      expect(subject).to respond_to(:working?).with(0).argument
    end

    it "returns true when it is working?" do
      expect(subject.working?).to eql(true)
    end
  end

end