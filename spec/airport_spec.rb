require 'airport'
describe Airport do
let(:airport) {double(:airport, :stormy => false)}

it { is_expected.to respond_to(:land).with(1).argument }
it { is_expected.to respond_to(:depart).with(1).argument }
it { is_expected.to respond_to :stormy?  }
	
	it '#land' do
	airport = described_class.new
	plane = double(:plane)
	airport.land(plane)
	expect(airport.planes).to include plane
	end	

	it '#depart' do
	airport = described_class.new
	plane = double(:plane)
	airport.land(plane)
	airport.depart(plane)
	expect(airport.planes).to_not include plane
	end	

	it '#stormy?' do 
	airport = described_class.new
	expect(airport.stormy?).to eq false
	end

	it "raises an error when plans are departed and its stormy" do
	plane = double(:plane)
	subject.land(plane)
	allow(subject).to receive(:stormy?) {true}
	expect{subject.depart(plane)}.to raise_error("unsafe flying conditions")
	end

end