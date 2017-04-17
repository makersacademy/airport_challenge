require 'airport'

describe Airport do
  subject(:airport) {described_class.new(50)}
  let(:plane) {double :plane}
  before do
    allow(plane).to receive(:land) {subject.land_plane(plane)}
    allow(plane).to receive(:takeoff) {subject.remove_plane(plane)}
  end

  it{is_expected.to respond_to(:sunny?)}

  context 'plane traffic is managed by controlling @landing_strip' do

    it '@landing_strip is empty be default' do
      expect(subject.landing_strip).to eq []
    end

    it 'allows setting maximum storage capacity for landed planes' do
      expect(subject.capacity).to eq 50
    end

    it 'sets @capacity to 100 by default' do
      default_airport = Airport.new
      expect(default_airport.capacity).to eq 100
    end

  end

  context 'it should be able to store and release plane objects' do

    before {plane.land(subject)}

    it 'allows Plane objects to land by adding them to @landing_strip' do
      expect(subject.landing_strip).to eq [plane]
    end

    it 'allows planes to takeoff by removing them from @landing_strip' do
      plane.takeoff
      expect(subject.landing_strip).to eq []
    end

  end

end
