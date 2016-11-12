require "airplane"

describe Airplane do

  context "Setup" do
    it "tests for an Airplane class" do
      expect(subject.class).to eq(Airplane)
    end
  end

  context "Landing" do
    # it "expects airport to respond to a landed? method" do
    #   expect(subject).to respond_to(:landed?)
    # end
    #
    # it "expects landed? to be true if the plane has landed" do
    #   expect(subject).to be_landed
    # end
  end
end
