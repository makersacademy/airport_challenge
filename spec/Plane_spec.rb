require 'Plane.rb'

describe Plane do
    it {is_expected.to respond_to :instruct_to_land}
    it {is_expected.to respond_to :has_landed}
    #it {is_expected.to respond_to :has_not_landed}


    it 'confirms if plane has landed'do
        plane1 = Plane.new
        plane1.has_landed
        expect(subject.has_landed).to eq true
    end
    
 
    it 'instructs plane to land'do
        plane1 = Plane.new
        plane1.instruct_to_land
        expect(subject.instruct_to_land).to eq true
    end
    
    
    
end