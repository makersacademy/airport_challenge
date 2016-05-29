require 'Plane'

describe Plane do

	let(:plane) { Plane.new }
	let(:airport) { double(:airport) }

	describe '#status' do

		it 'should default to "airborne"' do
			expect(subject.status).to eq "airborne"
		end

		it 'should eq "landed" if on the ground' do
			subject.set_landed(airport)
			expect(subject.status).to eq "landed"
		end

		it 'should eq "airborne" if in the air' do
			subject.set_airborne
			expect(subject.status).to eq "airborne"
		end

		it 'should have nil airport attr if airborne' do
			subject.set_airborne
			expect(subject.airport).to eq nil
		end

	end	

end