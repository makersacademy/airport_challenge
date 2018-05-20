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
      allow(airport).to receive_messages(:name => "Gatwick")
      subject.land(airport)
      expect(subject.location).to eq "Gatwick"
    end
  end
end
