require 'airport_occupancy.rb'

RSpec.describe AirportOccupancy do
  context "Feature Testing - Testing responsivness of methods in class" do
    it "Responding to check_full" do
      is_expected.to respond_to(:check_full)
    end

    it "Responding to check_empty" do
      is_expected.to respond_to(:check_empty)
    end
  end

  context "Unit Testing - Testing the reported airport status" do
    it "In case of full airport" do
      state0 = AirportOccupancy.new(20, 20)
      expect(state0.check_full).to eq true
    end

    it "In case of full airport" do
      state1 = AirportOccupancy.new(20, 10)
      expect(state1.check_full).to eq false
    end

    it "In case of empty airport" do
      state2 = AirportOccupancy.new(20, 0)
      expect(state2.check_empty).to eq true
    end

    it "In case of empty airport" do
      state3 = AirportOccupancy.new(20, 10)
      expect(state3.check_empty).to eq false
    end
  end
end
