require 'plane.rb'
require 'airport.rb'

describe Plane do

  let(:plane) { Plane.new }
  let(:airport) { double :airport }

  describe ".taking_off" do
    it 'shows planes that are in the airport' do
      expect(plane).to respond_to :taking_off

    end
  end

  describe ".landing" do
    it 'shows planes that are in the airport' do
      expect(plane).to respond_to :landing

    end
  end

end
