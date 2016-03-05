require 'airport'
require 'plane'
require 'simplecov'
SimpleCov.start

describe Airport do 

	subject(:airport) {Airport.new}
	let(:plane) { double(:plane)}

	describe 'instruct the plane to land' do

		it {expect(subject).to respond_to(:land).with(1).argument }

		it 'has the plane at the airport' do
			subject.land plane
			expect(subject.planes).to include(plane)
		end
	end

	describe 'instruct a plane to take off' do

		it {expect(subject).to respond_to(:take_off).with(1).argument }

		it 'no longer has the plane at the airport' do
			#airport = double(Airport.new){plane,current_weather = :sunny}
			#subject.land plane
			subject.land plane
			allow(subject).to receive(:current_weather).and_return(:sunny)
			subject.take_off plane
			expect(subject.planes).not_to include(plane)
		end

		it 'expect error when take_off during storm' do
			subject.land plane
			subject.weather 
			expect{subject.take_off plane}.to raise_error(RuntimeError)
		end

	end

end




