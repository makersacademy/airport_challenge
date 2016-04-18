require 'weather'

	describe Weather do 
		
		it "initializes with a clear state" do
			expect(subject.clear).to be true
		end

		it "informs the current state" do
			expect(subject.clear?).to eq subject.clear
		end

		it "randomises state" do
			allow(subject).to receive(:weather_randomiser) { false }
			expect(subject.clear?).to eq false
		end

	end