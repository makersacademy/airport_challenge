require 'airport'

describe Airport do 
	describe '#class methods' do
		it { is_expected.to(respond_to(:land_plane).with(1).argument) }
		it { is_expected.to(respond_to(:take_off).with(1).argument) }
	end

 	describe '#land_plane' do
 		let(:plane) { plane = double(:plane) }
 		let(:weather) { weather = double(:weather) }

 		it 'plane is at airport after land_plane' do
 			allow(plane).to(receive(:land).and_return(true))
 			allow(weather).to(receive(:weather?).and_return("sunny"))
 			subject.land_plane(plane)
 			expect(subject.planes).to(eq([plane]))
 		end

 		it 'land_plane will not work if weather? is "stormy"' do
 			allow(plane).to(receive(:land).and_return(true))
 			allow(weather).to(receive(:weather?).and_return("stormy"))
 			expect{ subject.land_plane(plane) }.to(raise_exception("Error: Weather is too stormy to land!"))
 		end
 	end

 	describe '#take_off' do
 		let(:plane) { plane = double(:plane) }
 		let(:weather) { weather = double(:weather) }

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

 		it 'take_off will not work if weather? is "stormy"' do
 			allow(plane).to(receive(:land).and_return(true))
 			allow(plane).to(receive(:fly).and_return(true))
 			allow(weather).to(receive(:weather?).and_return("stormy"))
 			subject.land_plane(plane)
 			expect{ subject.take_off(plane) }.to(raise_exception("Error: Weather is too stormy to take off!"))
 		end
 	end
end