require 'plane'

describe Plane do
=begin   
    describe "Plane instructed to land." do
        
        it { is_expected.to respond_to :land_plane}
        
        it "Plane returns a status of 'down' when it is instructed to land." do
            expect(subject.land_plane).to eq "down"
        end    
    
    end
    
    describe "Plane instructed to take-off." do

        it {is_expected.to respond_to :take_off}
        
        it "Plane returns a status of 'up' when it is instructed to take-off." do
            expect(subject.take_off).to eq "up"
        end
    end  
     
=end     
end