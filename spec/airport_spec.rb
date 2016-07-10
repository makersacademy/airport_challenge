require 'airport'

describe Airport do 
	describe '#class methods' do
		it { is_expected.to(respond_to(:land_plane).with(1).argument) }
	end

 	describe '#land_plane' do
 		it 'land_plane calls plane.land' do
 			plane = Plane.new
 			subject.land_plane(plane)
 			expect(plane.landed).to(eq(true))
 		end
 	end
	
end