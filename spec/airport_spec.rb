

# After you must find a way to reorganise these tests.

require_relative "../lib/airport"


describe Airport do

  let(:plane) { double("Plane") }
  let(:weather) { double("Weather")}

  subject(:airport) { described_class.new({}, weather) }

  describe "#land" do

    before do
        allow(weather).to receive(:stormy?).and_return(true)
    end

    context "when stormy" do

      it "raises an error with descriptive message" do
        expect{airport.land(plane)}.to raise_error("It's too stormy")
      end

    end

    context "when plane not in air" do

      before do
          allow(weather).to receive(:stormy?).and_return(false)
          allow(plane).to receive(:flying?).and_return(false)
      end

      it "raises an error with descriptive message" do
        expect{airport.land(plane)}.to raise_error("The plane is not flying")
      end

    end

    context "when airport full" do

      before do
          allow(weather).to receive(:stormy?).and_return(false)
          allow(plane).to receive(:flying?).and_return(true)
          allow(airport).to receive(:is_full?).and_return(true)
      end

      it "raises an error with descriptive message" do
        expect{airport.land(plane)}.to raise_error("There's no space to land here.")
      end

    end

    context "when checks are all passed" do

      before do
          allow(weather).to receive(:stormy?).and_return(false)
          allow(plane).to receive(:flying?).and_return(true)
          allow(plane).to receive(:land)
          allow(airport).to receive(:is_full?).and_return(false)
      end

      it "docks the plane" do
        airport.land(plane)
        expect(airport.hanger).to include(plane)
      end

# You need to write a test for physical act of landing the plane.

    end

  end


    describe "takeoff" do


          before do
              allow(weather).to receive(:stormy?).and_return(true)
          end

          context "when stormy" do

            it "raises an error with descriptive message" do
              expect{airport.takeoff(plane)}.to raise_error("It's too stormy")
            end

          end

          context "when plane not on ground" do

            before do
                allow(weather).to receive(:stormy?).and_return(false)
            end

            it "raises an error with descriptive message" do
              expect{airport.takeoff(plane)}.to raise_error("The plane is not here")
            end

          end

          context "when checks passed" do

              before do
                  allow(weather).to receive(:stormy?).and_return(false)
                  allow(plane).to receive(:flying?).and_return(true)
                  allow(plane).to receive(:land)
                  allow(plane).to receive(:fly)
                  allow(airport).to receive(:is_full?).and_return(false)
                  airport.land(plane)
               end


            it "dedocks the plane" do
               expect{airport.takeoff(plane)}.to change{airport.hanger}.from([plane]).to([])
            end

            # You need to write a test to change physical flight

          end

    end


  end
