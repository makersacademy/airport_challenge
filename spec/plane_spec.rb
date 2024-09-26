require './lib/plane.rb'

describe Plane do
    subject(:plane) { described_class.new }
    
    it "responds to #airbourne whilst default" do
        expect(plane).to respond_to(:airbourne)
    end


end