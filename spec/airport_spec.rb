require 'airport'

describe Airport do 
	describe '#class methods' do
		it { is_expected.to(respond_to(:land_plane).with(1).argument) }
		it { is_expected.to(respond_to(:take_off).with(1).argument) }
	end

 	describe '#land_plane' do
 		let(:plane) { plane = double(:plane) }

 		# it 'land_plane calls plane.land and plane.landed returns true' do
 		# 	allow(plane).to(receive(:land).and_return(true))
 		# 	allow(plane).to(receive(:landed).and_return(true))
 		# 	subject.land_plane(plane)
 		# 	expect(plane.landed).to(eq(true))
 		# end

 		it 'plane is at airport after land_plane' do
 			allow(plane).to(receive(:land).and_return(true))
 			subject.land_plane(plane)
 			expect(subject.planes).to(eq([plane]))
 		end
 	end

 	describe '#take_off' do
 		let(:plane) { plane = double(:plane) }

 		it 'plane is not at airport after take_off' do
 			allow(plane).to(receive(:land).and_return(true))
 			allow(plane).to(receive(:fly).and_return(true))
 			subject.land_plane(plane)
 			subject.take_off(plane)
 			expect(subject.planes).to(eq([]))
 		end

 		it 'take_off plane that is not at current airport raises "Error: Plane is not at this airport!"' do
 			allow(plane).to(receive(:land).and_return(true))
 			expect{ subject.take_off(plane) }.to(raise_exception("Error: Plane is not at this airport!"))
 		end
 	end
end