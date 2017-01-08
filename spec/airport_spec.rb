require "airport.rb"

describe Airport do
  test_airport = Airport.new("Paris")

  describe ".new" do
    it "takes an argument" do
      expect{test_airport}.not_to raise_error
    end
    it "saves argument to @airport_name" do
      expect(test_airport.airport_name).to eq "Paris"
    end
  end

  describe ":airport_name" do
    subject(:airport) { test_airport }
    it { is_expected.to respond_to(:airport_name) }
  end



end
