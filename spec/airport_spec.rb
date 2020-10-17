require 'Airport'
require 'Plane'

RSpec.describe Plane do  #subject stands for the class (ie plane)

  describe "land_at_airport" do
    it {is_expected.to respond_to (:land)}
  end

  describe "location_of_plane" do
    it {is_expected.to respond_to (:location)}
  end

  # describe "confirm_location_of_plane" do  #this is short hand 
  #   plane = Plane.new
  #   plane.land
  #   subject {plane.location}
  #   it {is_expected.to eq ("airport")}
  # end

  describe "confirm_location_of_plane" do 
    plane_1 = Plane.new #making sure i have plane and location are at the right place to do a test against
    plane_1.land   #same as above note 
    it "checking that locaiton is now airport" do
      expect(plane_1.location).to eq ("airport")
    end
  end

end


