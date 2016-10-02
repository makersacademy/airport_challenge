require 'airport.rb'
#require 'weather.rb'

describe Airport do
  subject(:airport) { described_class.new(50) }
  let(:plane) {double :plane}

  describe '#land' do
    it "airport can instruct the plane to land" do
      #allow(airport).to receive(:stormy?).and_return true
      expect(airport).to respond_to(:land).with(1).argument
    end

    it "airport can confirm that a plane has landed" do
      expect(airport).to respond_to(:confirm_land).with(1).argument
    end

    it "airport does not allow plane to land when airport is full" do
      50.times do
        airport.land(plane)
      end
      expect { airport.land(plane) }.to raise_error "airport is full, can't land plane"
      #allow(airport).to respond_to(:full?).and_return false
     end
#
#     it "airport can prevent plane from landing when weather is stormy" do
#       allow(airport).to receive(:stormy?).and_return true
#       expect { airport.land(plane) }.to raise_error "weather is stormy, can't land plane"
#     end
#
  end
#
  describe "#take_off" do
    it 'airport can instruct plane to take off' do
#       allow(airport).to receive(:stormy?).and_return true
      expect(airport).to respond_to(:take_off).with(1).argument
    end
#
    it 'airport can confirm that the plane is no longer in the airport' do
      expect(airport).to respond_to(:confirm_take_off).with(1).argument
    end
#
#     it "airport can prevent plane from taking off when weather is stormy" do
#       allow(airport).to receive(:stormy?).and_return true
#       expect { airport.take_off(plane) }.to raise_error "weather is stormy, can't take off"
#     end
#
  end
#
end
