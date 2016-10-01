require 'plane'

describe Plane do
	it {is_expected.to respond_to(:land).with(1).argument}
	before(:each) { @plane = Plane.new }
	describe '#land' do
		it "lands at an airport" do
			subject.land(double(:airport))
			expect(@plane).to be_landed
		end
	end

end