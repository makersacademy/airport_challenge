require "weather"

describe Weather  do 
	
	describe "#conditions" do
		it "returns current weather conditions" do
			expect(subject.conditions).to eq("Sunny").or(eq("Stormy"))
		end
	end


	
end