require "airport.rb"
require "plane.rb"

describe Airport do
  subject(:airport) {described_class.new(50)}
  let(:plane) {double :plane}

  describe '#land' do

    it "airport can instruct a plane to land" do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it "airport can confirm that a plane has landed" do
      expect(airport).to respond_to(:confirm_land).with(1).argument
    end

    context 'when full' do
      it "airport prevents plane from landing and raises error" do
        50.times do
          airport.land(plane)
        end
        expect { airport.land(plane) }.to raise_error "can't land plane, airport is full"
      end
    end
  end

  describe '#take_off' do

    it "airport can instruct a plane to take off" do
      expect(airport).to respond_to(:take_off).with(1).argument
    end

    it "airport can confirm that a plane is no longer in the airport" do
      expect(airport).to respond_to(:confirm_take_off).with(1).argument
    end
  end
end
