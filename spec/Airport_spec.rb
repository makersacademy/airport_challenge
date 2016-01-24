require 'Airport.rb'


describe Airport do
    
    it{is_expected.to respond_to :airport_whos_in}
    
    it 'should instruct a plane to land' do
        airport1 = Airport.new
        plane1 = Plane.new
        plane1.plane_to_land
        plane1.confirm_landed
        airport1.instruct_to_land(plane1)
        expect(subject.instruct_to_land(plane1)).to eq true
    end

    
    
    
end