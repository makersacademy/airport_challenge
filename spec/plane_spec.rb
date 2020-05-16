require_relative '../lib/plane.rb'

describe Plane do
  describe '#land_at(airport)' do
    it "should respond to" do
      expect(Plane.new).to respond_to(:land_at).with(1).argument
    end
  end
end
