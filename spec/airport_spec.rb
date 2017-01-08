require "airport.rb"

describe Airport do

  test_airport = Airport.new("Paris")
  subject(:airport) { test_airport }

  describe ".new" do
    it "takes an argument" do
      expect{test_airport}.not_to raise_error
    end
    it "saves argument to @airport_name" do
      expect(test_airport.airport_name).to eq "Paris"
    end
    it "saves false to @full?" do
      expect(test_airport.full?).to eq false
    end
  end

  describe ".airport_name" do
    it { is_expected.to respond_to(:airport_name) }
  end

  describe ".full?" do
    it { is_expected.to respond_to(:full?) }
  end



end
