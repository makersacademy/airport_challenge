require 'airport'
require 'plane'

describe Airport do 
  subject(:airport) { Airport.new }
  subject(:plane) { Plane.new }
  subject(:weather) { Weather.new }

  describe '#landing' do

      it "lands planes" do
        expect(airport).to respond_to(:landing).with(1).argument
      end

      it 'airport  is full' do
        #allow(plane).to receive(:permission?) {true}
        Airport::DEFAULT_CAPACITY.times { airport.landing(plane)  }
        expect{ airport.landing(plane) }.to raise_error("sorry, the airport is FULL")
      end

      it "stores landed planes" do
        allow(plane).to receive(:permission?) {true}
        expect(airport.landing(plane).pop.permission?).to eq true
      end
  end

  describe '#taking_off' do

     it "lands planes" do
        expect(airport).to respond_to(:taking_off).with(1).argument
      end

    it "plane takes off" do
      allow(airport).to receive(:weather)

      expect(airport).to respond_to(:taking_off)
    end

  end

end