require "airport"

describe Airport do

  context "Setup" do
    it "expects an Airport class to exist" do
      expect(subject.class).to eq(Airport)
    end
  end


  context "Take Off" do
    it "expects Airport to respond to a take_off method" do
      expect(subject).to respond_to(:take_off)
    end

  end

  context "Landing" do

    it "expects Airport to respond to a land_at_airport method" do
      expect(subject).to respond_to(:land_at_airport)
    end

    it "expects Airport to respond to a landed? method" do
      expect(subject).to respond_to(:landed?)
    end

    # it "expects landed? to be true if the plane has landed" do
    #   expect(subject).to be_landed
    # end

  end
end
