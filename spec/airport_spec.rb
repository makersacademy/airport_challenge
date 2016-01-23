require 'airport'

describe Airport do
  subject(:airport) {described_class.new(50)}
  let(:plane) {double :plane}

  context 'it should be able to store and release plane objects' do

    it 'has an instance variable @landing_strip' do
      expect(subject.landing_strip).to eq []
    end

    it 'allows Plane objects to land by adding them to @landing_strip' do
      allow(plane).to receive(:land).and_return (subject.land_plane(plane))
      plane.land(subject)
      expect(subject.landing_strip).to eq [plane]
    end

    it 'allows stored Plane objects to takeoff by removing them from @landing_strip and returning them' do
      allow(plane).to receive(:land).and_return (subject.land_plane(plane))
      allow(plane).to receive(:takeoff).and_return (subject.remove_plane(plane))
      plane.land(subject)
      plane.takeoff
      expect(subject.landing_strip).to eq []
    end

    it 'allows airport managers to set a maximum storage capacity for landed planes' do
      expect(subject.capacity).to eq 50
    end

    it 'sets @capacity to 100 by default' do
      default_airport = Airport.new
      expect(default_airport.capacity).to eq 100
    end

    it 'throws error when maximum plane capacity is reached' do
      #code
    end

  end

  context 'it interacts with the weather' do

      it{is_expected.to respond_to(:sunny?)}
      # Airport should be able to use Weather methods via module inclusion

  end

end
