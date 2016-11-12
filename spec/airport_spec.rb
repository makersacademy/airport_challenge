require './lib/airport.rb'

describe Airport do

  context "Make sure the class Airport responds to all of it's methods" do

    it "Expects Airport to respond to it's landing_bay method" do
      expect(subject).to respond_to(:landing_bay)
    end
  end
end
