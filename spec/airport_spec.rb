require "airport"

gatwick = Airport.new

describe Airport do

  context "land method" do

    it "expects instances of airport to respond to land method" do
      expect(gatwick).to respond_to(:land)
    end

    it "lands a plane" do
      boeing = gatwick.land
      expect(boeing).to be_landed
    end

  end

end
