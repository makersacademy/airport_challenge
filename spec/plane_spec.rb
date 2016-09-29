describe Plane do

  let(:plane) { Plane.new }
  let(:airport) { Airport.new }

  context 'in fine weather' do

    it 'reports where it has landed' do
      allow_any_instance_of(Airport).to receive(:stormy?).and_return(false)
      airport.land(plane)
      expect(plane.location).to eq :airport
    end

    it 'reports that it has taken-off' do
      allow_any_instance_of(Airport).to receive(:stormy?).and_return(false)
      airport.land(plane)
      airport.clear_for_take_off(plane)
      expect(plane.location).to eq :air
    end
  end

end
