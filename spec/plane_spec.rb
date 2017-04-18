require './lib/plane'

describe Plane do

  context 'when airport is sunny' do
    let(:airport) { double :airport, weather: "Sunny", name: "Test", full?: false, runway: [], land_plane: '', takeoff_plane: '' }

      describe '#land' do

        it "#planes can land at an #airport" do
          subject.land_at(airport)
          expect(subject.landed_at).to eq airport
        end

        it "cannot #land if already in #landed_at an #airport" do
          subject.landed_at = airport
          expect { subject.land_at(airport) }.to raise_error "Already landed at Test"
        end

        it "cannot #land_at a #full #airport" do
          allow(airport).to receive(:full?).and_return(true)
          expect { subject.land_at(airport) }.to raise_error "Cannot land, airport full"
        end

      end

      describe '#takeoff' do

        it "#planes can leave an #airport" do
          subject.landed_at = airport
          subject.takeoff
          expect(subject.landed_at).to be nil
        end

        it "cannot #takeoff if already in flight" do
          expect { subject.takeoff }.to raise_error "Already in flight"
        end

      end

    end

    context 'when #airport is #stormy' do

    let(:airport) { double :airport, weather: "Stormy", name: "Test", full?: false, runway: [], land_plane: '', takeoff_plane: '' }

      it "cannot #land if #weather is #stormy #airport" do
        expect { subject.land_at(airport) }.to raise_error "Cannot land, weather at Test stormy"
      end

      it "cannot #takeoff if #weather is #stormy #airport" do
        subject.landed_at = airport
        expect { subject.takeoff }.to raise_error "Cannot takeoff, weather at Test stormy"
      end

    end


end
