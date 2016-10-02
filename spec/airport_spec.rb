require "airport.rb"
require "plane.rb"

describe Airport do
  subject(:airport) {described_class.new(50)}
  let(:plane) {double :plane}

  describe '#land' do
    context 'when not stormy' do
      before do
        allow(airport).to receive(:stormy?).and_return false
      end

      it "airport can instruct a plane to land" do
        expect(airport).to respond_to(:land).with(1).argument
      end

      it "airport can confirm that a plane has landed" do
        expect(airport).to respond_to(:confirm_land).with(1).argument
      end

      context 'when airport is full' do
        it "airport prevents plane from landing and raises error" do
          50.times do
            airport.land(plane)
          end
          expect { airport.land(plane) }.to raise_error "can't land plane, airport is full"
        end
      end
    end

    context 'when stormy' do
      before do
        allow(airport).to receive(:stormy?).and_return true
      end

      it "cannot land plane when weather is stormy" do
        expect { airport.land(plane) }.to raise_error "can't land plane due to stormy weather"
      end
    end
  end


  describe '#take_off' do
    context 'when not stormy' do
      before do
        allow(airport).to receive(:stormy?).and_return false
      end

      it "airport can instruct a plane to take off" do
        expect(airport).to respond_to(:take_off).with(1).argument
      end

      it "airport can confirm that a plane is no longer in the airport" do
        expect(airport).to respond_to(:confirm_take_off).with(1).argument
      end
    end

    context 'when stormy' do
      before do
        allow(airport).to receive(:stormy?).and_return true
        allow(airport).to receive(:stormy?).and_return true
      end

      it "airport can prevent plane from taking off due to stormy weather" do
        expect { airport.take_off(plane) }.to raise_error "can't take off due to stormy weather"
      end
    end
  end
end
