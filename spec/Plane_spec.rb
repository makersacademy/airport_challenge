require 'Plane.rb'

describe Plane do
    it {is_expected.to respond_to :instruct_to_land}
    it {is_expected.to respond_to :land}


    it 'confirms if plane has landed'do
        plane1 = Plane.new
        plane1.instruct_to_land
        expect(plane1.land).to eq true
    end
    
    it 'instructs plane to land'do
        plane1 = Plane.new
        weather1 = Weather.new
        plane1.instruct_to_land
        expect(subject.instruct_to_land(weather1)).to eq true
    end
    
    
    
end