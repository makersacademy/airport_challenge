require 'airport'

describe Airport do
 let(:plane)   { Plane.new }
 let(:weather) { Weather.new }

  describe '#initialization' do
    # it 'creates a empty array for planes' do
    #   expect(subject.planes).to eq planes
    # end

    it 'has sets default capacity as 30' do
      allow(subject).to receive(:stormy?) { false }
      30.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error "Airport full...jog on"
    end

    it 'has a variable capacity' do
      airport = Airport.new(50)
      allow(airport).to receive(:stormy?) { false }
      50.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error "Airport full...jog on"
    end

  end


  describe '#land' do
    it { is_expected.to respond_to(:land) }

    it 'instructs a plane to land at a specific airport and confirm it has landed' do
      allow(subject).to receive(:stormy?) { false }
      expect(subject.land(plane)).to eq true
    end

    it 'contains plane that has landed' do
      allow(subject).to receive(:stormy?) { false }
      subject.land(plane)
      expect(subject.planes).to include plane
    end

    it 'should prevent landing in stormy weather' do
      allow(subject).to receive(:stormy?) { true }
      expect { subject.land(plane) }.to raise_error "Cannot land due to bad weather"
    end

  end

  describe '#add_plane' do
    it 'should add a plane' do
      expect(subject.add_plane(plane)).to eq [plane]
    end
  end


  describe '#take_off' do
    it 'should take_off' do
      allow(subject).to receive(:stormy?) { false }
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end

    it 'should prevent take_off if weather stormy' do
      allow(subject).to receive(:stormy?) { false }
      subject.land(plane)
      allow(subject).to receive(:stormy?) { true }
      expect { subject.take_off(plane) }.to raise_error "Cannot take off due to bad weather"
    end


  end

end
