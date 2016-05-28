require 'weather'

describe Weather do

	describe "#stormy?" do
		it "should take stormy? message" do
			expect(subject).to respond_to(:stormy?)
		end
		it "should reply with true or false" do
			expect(subject).to be_a(Boolean)
		end
	end

end