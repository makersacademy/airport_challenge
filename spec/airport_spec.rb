require 'airport'

describe Airport do

  let(:plane){double(:plane)}

  it 'has a default capacity' do
    expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
  end


  describe 'landing' do

    it 'allows planes to land' do
      allow(subject.weather).to receive(:stormy?) {false}
      expect(subject).to be_allow_landing
    end

    it 'receives a plane' do
      allow(subject.weather).to receive(:stormy?) {false}
      num_planes = subject.planes.count
      subject.receive_plane(plane)
      expect(subject.planes.count).to eq num_planes+1
    end

  end


  describe 'take off' do

    it 'releases specific plane' do
      allow(subject.weather).to receive(:stormy?) {false}
      p1 = double :p1
      p2 = double :p2
      p3 = double :p3
      subject.receive_plane (p1)
      subject.receive_plane (p2)
      subject.receive_plane (p3)
      expect(subject.release_plane(p2)).to eq p2
    end

    it 'following take off from a full airport, allows another plane to land' do
      allow(subject.weather).to receive(:stormy?) {false}
      subject.capacity.times { subject.receive_plane(plane) }
      subject.release_plane(plane)
      expect(subject).to be_allow_landing
    end

  end


  describe 'traffic control' do

    describe 'when airport is full' do

      it 'does not allow a plane to land' do
        allow(subject.weather).to receive(:stormy?) {false}
        subject.capacity.times {subject.receive_plane(plane)}
        expect(subject).not_to be_allow_landing
      end

      it 'does not receive plane' do
        allow(subject.weather).to receive(:stormy?) {false}
        subject.capacity.times {subject.receive_plane(plane)}
        num_planes = subject.planes.count
        subject.receive_plane(plane)
        expect(subject.planes.count).to eq num_planes
      end

    end


    describe 'stormy weather' do

      it 'checks for stormy weather before allowing landing' do
        expect(subject.weather).to receive :stormy?
        subject.allow_landing?
      end

      it 'doesn\'t allow landing in stormy weather' do
        allow(subject.weather).to receive(:stormy?) {true}
        expect(subject).not_to be_allow_landing
      end

      it 'doesn\'t allow taking off in stormy weather' do
        allow(subject.weather).to receive(:stormy?) {true}
        expect(subject).not_to be_allow_take_off
      end

    end

  end

end
