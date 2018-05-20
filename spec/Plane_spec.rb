require 'Plane'
describe Plane do
  let(:airport) { double :airport }

  describe '#land' do
    it 'can land at an airport with name Heathrow' do
      allow(airport).to receive(:add_plane)
      allow(airport).to receive_messages(:name => "Heathrow")
      subject.land(airport)
      expect(subject.location).to eq "Heathrow"
    end
    it 'can land at an airport with name Gatwick' do
      allow(airport).to receive(:add_plane)
      allow(airport).to receive_messages(:name => 'Gatwick')
      subject.land(airport)
      expect(subject.location).to eq "Gatwick"
    end
    it 'can only land if it is currently flying' do
      allow(airport).to receive(:add_plane)
      allow(airport).to receive_messages(:name => 'Heathrow')
      subject.land(airport)
      expect { subject.land(airport) }.to raise_error("Cannot land if already on ground")
    end
  end

  describe '#take_off' do
    it 'can take off from an airport' do
      allow(airport).to receive(:remove_plane)
      allow(airport).to receive(:add_plane)
      allow(airport).to receive_messages(:name => "Heathrow")
      subject.land(airport)
      subject.take_off
      expect(subject.location).to eq "Flying"
    end
  end

end
