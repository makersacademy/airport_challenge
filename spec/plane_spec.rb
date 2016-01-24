require 'plane'

describe Plane do

  subject(:plane) { described_class.new }

  let(:airport) { double :airport }
  let(:weather) { double :weather }

  it 'has a Plane class' do
    expect(plane).to be_a(Plane)
  end

  it 'stores whether a plane is in flight (true by default)' do
    expect(plane.instance_variable_get(:@in_flight)).to eq(true)
  end

  context 'landing planes' do

    it 'can not land when stormy' do
      allow(weather).to receive(:stormy?) { true }
      allow(airport).to receive(:full?) { false }
      expect{plane.land(airport, weather)}.to raise_error("Unsafe to land due to weather")
    end

    context "when weather isn't stormy" do

      before do
        allow(weather).to receive(:stormy?) { false }
        allow(airport).to receive(:stored_planes).and_return([])
      end

      it 'can not land when airport is full' do
        allow(airport).to receive(:full?) { true }
        expect{plane.land(airport, weather)}.to raise_error("Airport full")
      end

      context "and an airport isn't full" do

        before do
          allow(airport).to receive(:full?) { false }
        end

        it 'can land at airport when safe' do
          plane.land(airport, weather)
          expect(airport.stored_planes).to eq([plane])
        end

        context "when planes are landed" do

          before do
            plane.land_status
          end

          it 'can not land a plane if plane is already landed' do
            expect{plane.land(airport, weather)}.to raise_error("Plane already landed")
          end

          it "can be changed to 'in_flight'" do
            plane.flight_status
            expect(plane.in_flight).to eq(true)
          end

        end

      end

    end

  end

end
