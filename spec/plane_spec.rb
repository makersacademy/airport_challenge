require 'plane'
require 'airport'


describe Plane do

	plane = Plane.new

	describe '#basic tests' do

		it 'returns an instance of plane' do
		expect(plane).to be_a(Plane)
		end

		it {is_expected.to respond_to(:landed?)}  #landed? method in class Plane

		it {is_expected.to respond_to(:taken_off?)}  #taken_off? method in class Plane

	end
end












