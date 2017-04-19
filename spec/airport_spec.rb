require "airport"
require "plane"

  describe Airport do

    subject(:airport) { Class.new }

    let(:weather) { double :weather }
    let(:plane) { double :plane }

    context "good weather" do
      it "instructs a plane to land" do
        allow(weather).to receive(:stormy?) { false }
        expect(airport.land(:plane)).to eq true
      end
    end


  end
