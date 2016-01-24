require 'airport'
require 'weather'

describe Airport do
	it {is_expected.to respond_to(:allow_takeoff)}

    it 'raises error message when airport full' do
		plane = (double :plane)
		weather = (double :weather)
		allow(weather).to receive(:stormy?){false}
		Airport::DEFAULT_CAPACITY.times {subject.allow_landing(plane, weather)}
		expect {subject.allow_landing(plane, weather)}.to raise_error("Airport is full")
	end

    it {is_expected.to respond_to(:allow_landing).with(2).argument}

	it 'returns landed planes' do
		plane = (double :plane)
		weather = (double :weather)
		allow(weather).to receive(:stormy?){false}
		x =  subject.allow_landing(plane, weather)
		expect(subject.instance_variable_get(:@planes)).to eq(x)
	end

    it {is_expected.to respond_to(:full?)}

	describe '#allows takeoff' do

		it 'raises error when there are no planes in airport' do
		weather = (double :weather)
	    expect {subject.allow_takeoff(weather)}.to raise_error("No planes available for takeoff")
        end
    end

	context "when a default is specified" do
		it 'has a default capacity' do
			expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
		end
		it 'uses that default' do
			capacity = 20
			expect(subject.capacity).to eq(capacity)
		end
	end

	it 'stops takeoff in stormy weather' do
	 plane = double(:plane)
	 weather = double(:weather)
	 allow(weather).to receive(:stormy?){false}
	 subject.allow_landing(plane,weather)
	 allow(weather).to receive(:stormy?) {true}
	 expect{subject.allow_takeoff(weather)}.to raise_error("No takeoffs due to stormy weather")
	end

	it 'stops landing due to stormy weather' do
	 plane = double(:plane)
	 weather = double(:weather)
	 allow(weather).to receive(:stormy?) {true}
	 expect{subject.allow_landing(plane,weather)}.to raise_error("No landings due to stormy weather")
	end

end
	