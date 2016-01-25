
require 'airport'

describe Airport do

	subject(:airport){ described_class.new }     
																						
	it { is_expected.to respond_to :land }

	it 'confirmation plane landed' do
		subject = Airport.new
		weather = Weather.new
		allow(weather).to receive(:stormy?) { false } #stub it!

		expect(subject.land(Plane.new, weather.stormy?)).to eq "Plane has landed"
	end

	it { is_expected.to respond_to :take_off }

	it 'take off when airport is empty' do
		subject = Airport.new
		weather = Weather.new
		allow(weather).to receive(:stormy?) { false } #stub it!

		expect(subject.take_off(weather.stormy?)).to eq nil
	end

	it 'take off after land' do
		weather = Weather.new
		allow(weather).to receive(:stormy?) { false } #stub it!
		subject = Airport.new
		subject.land(Plane.new, weather.stormy?)

		expect(subject.take_off(weather.stormy?)).to eq nil
	end

	it { is_expected.to respond_to :full? }

	it 'checks airport is full' do
		expect(subject.full?).to eq false
		weather = Weather.new
		allow(weather).to receive(:stormy?) { false } #stub it!
		
		subject.land(Plane.new, weather.stormy?)
		expect(subject.full?).to eq true
	end

	it 'on stormy weather planes cannot take off' do
		weather = Weather.new
		subject = Airport.new
		allow(weather).to receive(:stormy?) { false } #stub it!
		subject.land(Plane.new, weather.stormy?)
		
		allow(weather).to receive(:stormy?) { true } #stub it!
		expect(subject.take_off(weather.stormy?)).not_to eq nil
	end

	it 'on stormy weather planes cannot land' do
		subject = Airport.new
		weather = Weather.new
		allow(weather).to receive(:stormy?) { true } #stub it!
		expect(subject.land(Plane.new, weather.stormy?)).to eq "Landing not allowed due to bad weather"
	end
end