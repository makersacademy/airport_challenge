require 'airport'

describe Airport do

  let(:plane){double(:plane)}

  it 'has a default capacity' do
    expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
  end


  describe 'landing' do

    before(:each) do
      allow(subject.weather).to receive(:stormy?) {false}
      allow(subject).to receive(:weather_update) {
          @weather}
    end

    it 'allows planes to land' do
      expect(subject).to be_allow_landing
    end

    it 'receives a plane' do
      num_planes = subject.planes.count
      subject.receive_plane(plane)
      expect(subject.planes.count).to eq num_planes+1
    end

  end


  describe 'take off' do

    before(:each) do
      allow(subject.weather).to receive(:stormy?) {false}
      allow(subject).to receive(:weather_update) {
          @weather}
    end

    it 'releases specific plane' do
      p1 = double :p1
      p2 = double :p2
      p3 = double :p3
      subject.receive_plane (p1)
      subject.receive_plane (p2)
      subject.receive_plane (p3)
      expect(subject.release_plane(p2)).to eq p2
    end

    it 'following take off from a full airport, allows another plane to land' do
      subject.capacity.times { subject.receive_plane(plane) }
      subject.release_plane(plane)
      expect(subject).to be_allow_landing
    end

  end


  describe 'traffic control' do

    context 'when airport is full' do

      before(:each) do
        allow(subject.weather).to receive(:stormy?) {false}
        allow(subject).to receive(:weather_update) {
          @weather}
        subject.capacity.times {subject.receive_plane(plane)}
      end

      it 'does not allow a plane to land' do
        expect(subject).not_to be_allow_landing
      end

      it 'does not receive plane' do
        num_planes = subject.planes.count
        subject.receive_plane(plane)
        expect(subject.planes.count).to eq num_planes
      end

    end


    context 'stormy weather' do

      before(:each) do
        allow(subject.weather).to receive(:stormy?) {true}
        allow(subject).to receive(:weather_update) {
          @weather}
      end

      it 'checks for stormy weather before allowing landing' do
        expect(subject.weather).to receive :stormy?
        subject.allow_landing?
      end

      it 'doesn\'t allow landing' do
        expect(subject).not_to be_allow_landing
      end

      it 'doesn\'t receive planes' do
        num_planes = subject.planes.count
        subject.receive_plane(plane)
        expect(subject.planes.count).to eq num_planes
      end

      it 'doesn\'t allow taking off' do
        expect(subject).not_to be_allow_take_off
      end

      it 'doesn\'t release planes' do
        allow(subject.weather).to receive(:stormy?) {false}
        subject.receive_plane(plane)
        num_planes = subject.planes.count
        allow(subject.weather).to receive(:stormy?) {true}
        subject.release_plane(plane)
        expect(subject.planes.count).to eq num_planes
      end

    end

    describe 'updates weather' do

      it 'checks weather update before allowing landing' do
        expect(subject).to receive(:weather_update)
        subject.allow_landing?
      end

      it 'updates the weather before allowing landing' do
        w1 = subject.weather
        subject.allow_landing?
        expect(subject.weather).not_to eq w1
      end

      it 'checks weather update before allowing take off' do
        expect(subject).to receive(:weather_update)
        subject.allow_take_off?
      end

      it 'updates the weather before allowing take off' do
        w1 = subject.weather
        subject.allow_take_off?
        expect(subject.weather).not_to eq w1
      end

    end

  end

end
