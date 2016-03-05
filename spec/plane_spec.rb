require 'plane'

describe Plane do
	
	it 'responds to the method landed?' do
		expect(subject).to respond_to (:landed?)
	end

	it 'confirms that a plane has not yet landed' do
		expect(subject.landed?).to eq false
	end

	it 'responds to the method taken_off?' do
		expect(subject).to respond_to (:taken_off?)
	end

	it 'confirms that a plane has not yet taken off' do
		expect(subject.landed?).to eq false
	end








end