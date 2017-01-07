require 'airport'

describe Airport do

	it {is_expected.to respond_to(:land_plane).with(1).argument}
	
	it {is_expected.to respond_to :take_off}

	describe '#land_plane' do
		it 'allows planes to land in good weather' do
			allow(subject).to receive(:stormy?).and_return false
			plane = Plane.new
			expect(subject.land_plane(plane)).to eq plane
		end

		it 'raises an error when stormy' do
			#airport = double("airport")
			allow(subject).to receive(:stormy?).and_return true
			expect{subject.land_plane(Plane.new)}.to raise_error 
		end

	end

	describe '#take_off' do
		it 'allows planes to leave airport' do
			plane = Plane.new
			subject.take_off
			expect(subject.take_off).to eq nil
		end
	end

end