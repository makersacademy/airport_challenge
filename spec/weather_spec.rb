require "weather"

describe Weather  do 
	
	describe "#conditions" do
		it "returns current weather conditions" do
			expect(subject.conditions).to eq "Sunny"
		end
	end


	
end