require 'spec_helper'
require './lib/airport'
require './lib/plane'

	describe Airport do 
		#This is to check for for the capacity of the airport
		#in order to prevent landing
		subject { described_class.new(capacity: 20)}
		let(:plane) {Plane.new}

		it 'lets plane land' do
		plane.land?
		expect { subject.land(plane) }.to change {subject.count_plane}.by 1
		end

		it 'does not let plane land and raises error when full' do
		20.times { subject.land(plane) }
		expect { subject.land(plane) }.to raise_error(RuntimeError, 'Airport is full, cannot let plane land' )	
		end


end