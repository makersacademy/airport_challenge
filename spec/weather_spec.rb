require 'weather'

describe Weather do 
	subject (:weather) { described_class.new }
	#not sure how to test this is random. Could equal true or false??
	#kernel


	it "should be true when random is less than 10 " do
	
	allow(Kernel).to receive(:rand).and_return 7
	expect(weather.stormy?).to eq true
	end


	it "should be false when random is more than ten" do
	allow(Kernel).to receive(:rand).and_return 50
	expect(weather.stormy?).to eq false
	end






	
end