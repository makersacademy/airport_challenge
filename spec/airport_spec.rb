
require 'airport'
require 'plane'

describe Airport do
	let(:plane) {Plane.new}
	#it 'responds to land with 1 argument' do
	#subject { is_expected.to respond_to(:land).with(1).argument }
	#end

	it 'says that it has landed' do 
	allow(subject).to receive(:stormy?).and_return(false)
	expect(subject.land(plane)).to include plane
	end


	it 'stops the plane landing' do 
	allow(subject).to receive(:stormy?).and_return(true)
	expect{subject.release_planes}.to raise_error 'the weather is stormy'
	end

	#it 'responds to has take off' do
	#expect {is_expected.to respond_to(:take_off).with(1).argument }
	#end


	#it 'responds to release_planes' do
	#expect(subject).to respond_to 'release_planes'
	#end

	it 'fails if it is stormy' do
	allow(subject).to receive(:stormy?).and_return(true)
	expect{subject.release_planes}.to raise_error 'the weather is stormy'
	end

	it 'fails if it is stormy' do
	allow(subject).to receive(:stormy?).and_return(false)
	expect(subject.release_planes).to eq []
	end

	it 'fails if the plane hasnt taken off yet' do 
	plane.report_landed
	expect {subject.land plane}.to raise_error 'the plane hasnt taken off yet'
	end

	describe '#land' do
        it 'raises an error when exceding DEFAULT_CAPACITY' do
        allow(subject).to receive(:stormy?).and_return(false)
        subject.capacity.times { subject.land plane }
        expect { subject.land plane }.to raise_error 'no spaces available'
        end
	end




end
	