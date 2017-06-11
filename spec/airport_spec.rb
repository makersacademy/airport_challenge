

# After you must find a way to reorganise these tests.

require_relative "../lib/airport"

describe Airport do

  let(:aircraft) { double("aircraft") }
  let(:weather) { double("Weather") }

  subject(:airport) { described_class.new({}, weather) }

  describe "#land" do

    context "its instructions" do

      before do
        allow(airport).to receive(:prepare_for_landing)
      end

      it "instructs the airport to prepare for a landing" do
        expect(airport).to receive(:prepare_for_landing)
        airport.land(aircraft)
      end

      context "when checks pass"

      before do
        allow(aircraft).to receive(:land)
        allow(airport).to receive(:dock)
      end

      it "instructs the aircraft to land" do
        expect(aircraft).to receive(:land)
        airport.land(aircraft)
      end

      it "it instructs the airport to dock the landed plane" do
        expect(airport).to receive(:dock)
        airport.land(aircraft)
      end

    end

  end

  context "its behaviour" do

    context "when stormy" do

      before do
        allow(weather).to receive(:stormy?).and_return(true)
      end

      it "raises an error with descriptive message" do
        expect { airport.land(aircraft) }.to raise_error("It's too stormy")
      end

    end

    context "when aircraft not in air" do

      before do
        allow(weather).to receive(:stormy?).and_return(false)
        allow(aircraft).to receive(:flying?).and_return(false)
      end

      it "raises an error with descriptive message" do
        expect { airport.land(aircraft) }.to raise_error("The aircraft is not flying")
      end

    end

    context "when airport full" do

      before do
        allow(weather).to receive(:stormy?).and_return(false)
        allow(aircraft).to receive(:flying?).and_return(true)
        allow(airport).to receive(:full?).and_return(true)
      end

      it "raises an error with descriptive message" do
        expect { airport.land(aircraft) }.to raise_error("There's no space to land here.")
      end

    end

    context "when checks pass" do

      before do
        allow(weather).to receive(:stormy?).and_return(false)
        allow(aircraft).to receive(:flying?).and_return(true)
        allow(aircraft).to receive(:land)
        allow(airport).to receive(:full?).and_return(false)
      end

      it "docks the aircraft" do
        airport.land(aircraft)
        expect(airport.hanger).to include(aircraft)
      end

    end

  end

  describe "takeoff" do

    context "its instructions" do

      before do
        allow(airport).to receive(:prepare_for_takeoff)
        allow(airport).to receive(:dedock)
        allow(aircraft).to receive(:fly)
      end

      it "instructs the airport to prepare for takeoff" do
        expect(airport).to receive(:prepare_for_takeoff)
        airport.takeoff(aircraft)
      end

      context "when checks pass" do

        it "instructs the airport to dedock the aircraft" do
          expect(airport).to receive(:dedock)
          airport.takeoff(aircraft)
        end

        it "instructs the aircraft to takeoff" do
          expect(airport).to receive(:dedock)
          airport.takeoff(aircraft)
        end
      end
    end

    context "its behaviour" do

      context "when stormy" do

        before do
          allow(weather).to receive(:stormy?).and_return(true)
        end

        it "raises an error with descriptive message" do
          expect { airport.takeoff(aircraft) }.to raise_error("It's too stormy")
        end

      end

      context "when aircraft not on ground" do

        before do
          allow(weather).to receive(:stormy?).and_return(false)
        end

        it "raises an error with descriptive message" do
          expect { airport.takeoff(aircraft) }.to raise_error("The aircraft is not here")
        end

      end

      context "when checks pass" do

        before do
          allow(weather).to receive(:stormy?).and_return(false)
          allow(aircraft).to receive(:flying?).and_return(true)
          allow(aircraft).to receive(:land)
          allow(aircraft).to receive(:fly)
          allow(airport).to receive(:full?).and_return(false)
          airport.land(aircraft)
        end

        it "dedocks the aircraft" do
          expect { airport.takeoff(aircraft) }.to change { airport.hanger }.from([aircraft]).to([])
        end

        it "lets the aircraft put itself in flight" do
          expect(aircraft).to receive(:fly)
          airport.takeoff(aircraft)
        end

      end
    end # end of context behaviour.
  end # end of takeoff

end
