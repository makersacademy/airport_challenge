require 'airport_occupancy.rb'

RSpec.describe AirportOccupancy do
  context "Function Testing - Testing responsivness of methods in class" do
    it "Responding to check_full" do
      is_expected.to respond_to(:check_full)
    end
  end

  context "Unit Testing - Testing the reported airport status" do
    it "In case of full airport" do
      state0 = AirportOccupancy.new(20, 20)
      expect(state0.check_full).to eq true
    end

    it "In case of full airport" do
      state0 = AirportOccupancy.new(20, 10)
      expect(state0.check_full).to eq false
    end
  end
end
