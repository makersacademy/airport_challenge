require 'Airport.rb'


describe Airport do
    
    it{is_expected.to respond_to :park}
    it{is_expected.to respond_to(:park).with(1).argument}
    
    it 'parks a plane' do
        plane1 = Plane.new
        plane1.instruct_to_land
        plane1.land
        airport1 = Airport.new
        expect(airport1.park(plane1)).to  include(plane1)
    end
    
    it "checks plane is parked in list" do
        airport1 = Airport.new
        plane1 = Plane.new
        plane1.instruct_to_land
        plane1.land
        airport1.park(plane1)
        expect(airport1.show_planes).to match(plane1)
    end

    
    
    
end