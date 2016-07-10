require 'airport'

describe Airport do 
	describe '#class methods' do
		it { is_expected.to(respond_to(:land_plane).with(1).argument) }
	end

 	describe '#land_plane' do
 		let(:plane) { plane = double(:plane) }

 		it 'land_plane calls plane.land and plane.land returns true' do
 			allow(plane).to(receive(:land).and_return(true))
 			allow(plane).to(receive(:landed).and_return(true))
 			subject.land_plane(plane)
 			expect(plane.landed).to(eq(true))
 		end

 		it 'plane is at airport after land_plane' do
 			allow(plane).to(receive(:land).and_return(true))
 			allow(plane).to(receive(:landed).and_return(true))
 			subject.land_plane(plane)
 			expect(subject.planes).to(eq([plane]))
 		end
 	end
	
end