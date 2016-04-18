
require 'airport'
require 'plane'

describe Airport do
	let(:plane) {Plane.new}
	let(:airport) {subject}
	it 'says that it has landed' do 
	allow(airport).to receive(:stormy?).and_return(false)
	expect(airport.land(plane)).to include plane
	end


	it 'stops the plane landing' do 
	allow(airport).to receive(:stormy?).and_return(true)
	expect{airport.release_planes}.to raise_error 'the weather is stormy'
	end


	it 'fails if it is stormy' do
	allow(airport).to receive(:stormy?).and_return(true)
	expect{airport.release_planes}.to raise_error 'the weather is stormy'
	end

	it 'passes if it is  notstormy' do
	allow(airport).to receive(:stormy?).and_return(false)
	expect(airport.release_planes).to eq []
	end

	it 'fails if the plane hasnt taken off yet' do 
	plane.report_landed
	expect {airport.land plane}.to raise_error 'the plane hasnt taken off yet'
	end

	describe '#land' do
        it 'raises an error when exceding DEFAULT_CAPACITY' do
        allow(airport).to receive(:stormy?).and_return(false)
        airport.capacity.times { subject.land plane }
        expect { airport.land plane }.to raise_error 'no spaces available'
        end
	end




end
	