require 'airplane.rb'

describe Airplane do
	it "airplane class should exist" do
		expect(Airplane.new.is_a?(Airplane)).to eq true
	end
end	 