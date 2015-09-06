require 'plane'

describe Plane do
	describe 'method:new/initialize' do
		it 'is flying when created' do 
			expect(subject.flying).to eq(true)
		end
	end
	describe 'method:flying?' do
		it {expect(subject).to respond_to(:flying).with(0).argument}
	end
	describe 'method:current_airport' do
		it {expect(subject).to respond_to(:current_airport).with(0).argument}
	end
	describe 'method:land' do
		it 'can land at a specified airport' do
			expect(subject).to respond_to(:land).with(1).argument
		end
		it 'raises error when not given a valid airport object as destination' do
			class Airport; end
			airport = double(:airport_object)
			allow(airport).to receive(:is_a?).with(Airport).and_return(false)
			expect{subject.land(airport)}.to raise_error 'Not an airport'
		end
		it 'raises error when weather is stormy' do
			class Airport; end
			airport = double(:airport_object)
			allow(airport).to receive(:is_a?).with(Airport).and_return(true)
			allow(airport).to receive(:land_permission).and_raise("Stormy weather")
			expect{subject.land(airport)}.to raise_error "Stormy weather"
		end
		it 'raises error when airport is full' do
			class Airport; end
			airport = double(:airport_object)
			allow(airport).to receive(:is_a?).with(Airport).and_return(true)
			allow(airport).to receive(:land_permission).and_raise("Airport full")
			expect{subject.land(airport)}.to raise_error "Airport full"
		end
		it 'is landed/not-flying after landing and set current airport' do
			class Airport; end
			airport = double(:airport_object)
			allow(airport).to receive(:is_a?).with(Airport).and_return(true)
			allow(airport).to receive(:land_permission).and_return(nil)
			allow(airport).to receive(:plane_landed).with(subject).and_return(nil)
			subject.land(airport)
			expect(subject.flying).to eq(false)
			expect(subject.current_airport).to eq(airport)
		end
	end
	describe 'method:take_off' do
		it 'can take_off from its current airport' do
			expect(subject).to respond_to(:take_off).with(0).argument
		end
		it 'raises error if already flying' do
			expect{subject.take_off}.to raise_error "Already flying"
		end
		it 'raises error when permission to take off not granted' do
			class Airport; end
			airport = double(:airport_object)
			allow(airport).to receive(:is_a?).with(Airport).and_return(true)
			allow(airport).to receive(:land_permission).and_return(nil)
			allow(airport).to receive(:plane_landed).with(subject).and_return(nil)
			allow(airport).to receive(:take_off_permission).and_raise('Stormy')
			subject.land(airport)
			expect{subject.take_off}.to raise_error "Stormy"
		end
		it 'is flying and have left the airport after take-off' do
			class Airport; end
			airport = double(:airport_object)
			allow(airport).to receive(:is_a?).with(Airport).and_return(true)
			allow(airport).to receive(:land_permission).and_return(nil)
			allow(airport).to receive(:plane_landed).with(subject).and_return(nil)
			allow(airport).to receive(:take_off_permission).and_return(nil)
			allow(airport).to receive(:plane_taken_off).with(subject).and_return(nil)
			subject.land(airport)
			expect(subject.flying).to eq(false)
			expect(subject.current_airport).to eq(airport)
			subject.take_off
			expect(subject.flying).to eq(true)
			expect(subject.current_airport).to eq(nil)
		end
	end
end