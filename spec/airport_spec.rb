require 'airport'
describe Airport do
let(:airport) {double(:airport, :stormy => false)}

it { is_expected.to respond_to(:land).with(1).argument }
it { is_expected.to respond_to(:depart).with(1).argument }
it { is_expected.to respond_to :stormy?  }
it { is_expected.to respond_to :capacity  }

	
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
	expect{subject.depart(plane)}.to raise_error("unsafe flying conditions to depart")
	end

	it "raises an error when plans try to land and its stormy" do
	plane = double(:plane)
	subject.land(plane)
	allow(subject).to receive(:stormy?) {true}
	expect{subject.land(plane)}.to raise_error("unsafe flying conditions to land")
	end

	it 'prevents landing when airport is full' do 
	plane = double(:plane)
	airport = described_class.new
	airport.capacity.times { airport.land(plane) }
	expect{airport.land(plane)}.to raise_error("airport at capacity")
	end

end