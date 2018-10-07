require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double :plane }

  it 'sould be able to land a plane' do
    expect(subject.land(plane)).to eq "#{plane} landed at Arrival"
  end

  describe 'landing planes' do
    it 'has plane landed at airport' do
      subject.land(plane)
      allow(airport.arrival).to receive(:planes).and_return "#{[plane]}"
    end
  end
end
