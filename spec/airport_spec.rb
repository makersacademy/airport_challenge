require "airport"

describe Airport do
  let(:plane) {:plane}
  subject(:airport) {described_class.new}

  describe '#land_plane' do
      it 'should take a plane and add it to the hangar' do
        expect(subject.land(plane)).to eq [plane]
      end

      it 'has plane in hangar after landing' do
        airport.land(plane)
        expect(airport.hangar).to include plane
      end
  end

  describe '#take_off_plane' do
    context "sunny" do
      it 'should take off a plane and remove it from hangar' do
        allow(airport.weather).to receive(:stormy).and_return false
        airport.land(plane)
        expect(airport.take_off(plane)).to eq "#{plane} has taken off"
      end
    end

    context "stormy" do
      it "should prevent take off if stormy" do
        allow(airport.weather).to receive(:stormy).and_return true
        airport.land(plane)
        expect{airport.take_off(plane)}.to raise_error "The weather is too bad!"
      end
    end
  end
end
