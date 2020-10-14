require 'plane'

RSpec.describe Plane do
    
    describe 'initialize' do
        
        it 'Increments the plane id by 1 for each plane instantiated' do
            plane1 = Plane.new
            plane2 = Plane.new

            # 32 and 33 due to planes instantiated while testing Airport class
            expect(plane1.get_id).to eq 32
            expect(plane2.get_id).to eq 33
        end
    end
    
end
