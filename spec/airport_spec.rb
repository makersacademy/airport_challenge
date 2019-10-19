require "airport"

describe Airport do

  subject(:an_airport) {Airport.new}
  describe "open_for_landing?" do
    it "airport is open when initialized" do
      expect(an_airport.open_for_landing?).to eq true
    end

    # it "airport is open when sunny" do
    #   expect(an_airport.open_for_landing)
    # end

  end

  
end
