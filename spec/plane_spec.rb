require "plane"

describe Plane do
  # airport = Airport.new
  let(:airport) { Airport.new }

  describe "#land" do
    it "can land" do
      expect(subject.land).to eq "The plane landed"
    end
  end

  describe "#take_off" do
    it "can take off" do
      expect(subject.take_off).to eq "The plane took off"
    end
  end

end
