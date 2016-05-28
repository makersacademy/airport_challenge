require 'Plane'

describe Plane do

	let(:plane) { Plane.new }
	let(:airport) { double(:airport) }

	describe '#status' do

		it '#status should default to "airborne"' do
			expect(subject.status).to eq "airborne"
		end

		it '#status should eq "landed" if on the ground' do
			subject.set_landed
			expect(subject.status).to eq "landed"
		end

		it '#status should eq "airborne" if in the air' do
			subject.set_airborne
			expect(subject.status).to eq "airborne"
		end

	end	

end