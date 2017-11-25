require 'airport'
describe Airport do

	describe "#land" do
		it "should be able to receive a plane" do
			expect(subject).to respond_to(:land).with(1).argument
		end
	end


end