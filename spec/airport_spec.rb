require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land_a_plane).with(1).argument }

  it { is_expected.to respond_to :take_off_plane }

  describe '#take_off_plane' do
    it 'takes off a plane that landed' do
      plane = Plane.new
      allow(subject).to receive(:current_windspeed_report) { 1 }
      subject.land_a_plane(plane)
      expect(subject.take_off_plane).to eq plane
    end
  end

  describe '#take_off_plane' do
    it 'raises an error when there are no planes available' do
      expect { subject.take_off_plane }.to raise_error 'Unable to take off: no planes available'
    end
  end

  it { is_expected.to respond_to(:plane) }

  describe '#plane' do
    it 'returns landed planes' do
      plane = Plane.new
      allow(subject).to receive(:current_windspeed_report) { 1 }
      subject.land_a_plane(plane)
      expect(subject.plane).to eq plane
    end
  end

  describe '#plane' do
    it 'confirms plane no longer in airport after take-off' do
      plane = Plane.new
      allow(subject).to receive(:current_windspeed_report) { 1 }
      subject.land_a_plane(plane)
      subject.take_off_plane
      expect(subject.plane).to eq nil
    end
  end

  describe '#land_a_plane' do
    it 'raises an error when plane is already in airport' do
      plane = Plane.new
      allow(subject).to receive(:current_windspeed_report) { 1 }
      subject.land_a_plane(plane)
      expect { subject.land_a_plane(plane) }.to raise_error 'Unable to land: plane already in airport.'
    end
  end

  it { is_expected.to respond_to(:current_windspeed_report) }

  describe '#take_off_plane' do
    it 'raises an error when windspeed is greater than seven' do
      # Stormy weather is defined as windspeed >= 7 on the Beaufort scale.
      plane = Plane.new
      subject.land_a_plane(plane)
      # Using a stub to mimic consistently stormy weather:
      allow(subject).to receive(:current_windspeed_report) { 7 }
      expect { subject.take_off_plane }.to raise_error 'Take-off ban: storm force winds' if subject.current_windspeed_report >= 7
    end
  end

  describe '#land_a_plane' do
    it 'raises an error when windspeed is greater than seven' do
      plane = Plane.new
      allow(subject).to receive(:current_windspeed_report) { 7 }
      expect { subject.land_a_plane(plane) }.to raise_error 'Landing ban: storm force winds' if subject.current_windspeed_report >= 7
    end
  end
end
