require 'airport'

describe Airport do 
	subject(:airport) { described_class.new }

	it { is_expected.to respond_to(:landing).with(1).argument }
	it { is_expected.to respond_to(:departure) }
let(:plane) {double :plane }
	describe '#land' do
        it 'confirms landed or not' do
    		allow(plane).to receive(:landed?).and_return(true)
    		expect(subject.landing(plane)).to include plane
    	end	
	end

	describe '#departure' do
		it 'take off from the airport' do
			plane = Plane.new
			subject.landing(plane)
			expect(subject.departure(plane)).to eq plane
		end	
	end	
end
