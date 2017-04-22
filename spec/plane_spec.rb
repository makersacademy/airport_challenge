require './lib/plane'

describe Plane do

  context 'when airport is sunny' do
    let(:airport) { double :airport, name: "Test", full?: false, runway: [], land_plane: '', takeoff_plane: '' }
    let(:weather) { double :weather, condition: "Sunny", check_weather: "Sunny" }

    describe '#land' do
      before { allow(weather).to receive(:check_weather).with(airport).and_return("Sunny") }
      it "#planes can land at an #airport" do
        subject.land_at(airport)
        expect(subject.landed_at).to eq airport
      end

    end

    describe '#takeoff' do

      it "#planes can leave an #airport" do
        subject.landed_at = airport
        subject.takeoff
        expect(subject.landed_at).to be nil
      end

    end

  end

end
