require 'plane'

describe Plane do

  let(:airport) { double "an airport" }

    describe "#land" do
      it 'raises error when full' do
        allow(airport).to receive(:tell_weather) { "sunny" }
        airport.capacity.times { airport.land subject }
        expect { subject.land plane }.to raise_error 'No free spots avaialble'
      end
      it "lands the planes when sunny" do
        allow(subject).to receive(:tell_weather) { "sunny" }
        expect(subject.land(plane)).to eq [plane]
      end
      it "prevent from landing when stormy" do
        allow(subject).to receive(:tell_weather) { "stormy" }
        expect(subject.land(plane)).to eq nil
      end
    end

    describe "#take_off" do
      it "take off the planes when sunny" do
        subject.land(plane)
        allow(subject).to receive(:tell_weather) { "sunny" }
        subject.take_off(plane)
        expect(subject.planes_a).to eq []
      end
      it "prevent from taking off the planes when stormy" do
        allow(subject).to receive(:tell_weather) { "sunny" }
        subject.land(plane)
        allow(subject).to receive(:tell_weather) { "stormy" }
        subject.take_off(plane)
        expect(subject.planes_a).to eq [plane]
      end
    end
  describe "#status" do
    it 'tells if the plane is flying' do
      airport.land(subject)
      airport.take_off(subject)
      expect(subject.status).to eq "Plane is flying"
    end
    it 'tells if the plane is in the airport' do
      airport.land(subject)
      expect(subject.status).to eq "Plane is in the airport"
    end
  end

end
