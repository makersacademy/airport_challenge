require 'airport'

describe Airport do

  before do
    allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
  end

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:weather) { double :weather }

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }

  describe '#flying' do

    before do
      allow(plane).to receive(:airborne?)
      allow(plane).to receive(:flying).and_return true
      allow(plane).to receive(:landed).and_return false
    end

    it 'instructs plane to land' do
      expect(subject.land(plane)).to eq [plane]
    end

    it 'stops plane from landing in stormy weather' do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
      expect{subject.land(plane)}.to raise_error 'Too stormy to land!'
    end

    it 'stops plane from landing if airport is full' do
      Airport::DEFAULT_CAPACITY.times {subject.land(plane)}
      message = 'Try another airport!'
      expect{subject.land(plane)}.to raise_error (message)
    end

    it 'stops landing if plane is on the ground' do
      allow(plane).to receive(:airborne?).and_return false
      message = "Plane is already on the ground"
      expect{subject.land(plane)}.to raise_error (message)
    end

    it 'stops plane taking off if already flying' do
      allow(plane).to receive(:airborne?).and_return true
      message = "Plane is already airborne"
      expect{subject.take_off(plane)}.to raise_error (message)
    end

    it 'stops landing if plane is at another airport'



  describe '#landed' do

    before do
      allow(plane).to receive(:airborne?)
      allow(plane).to receive(:flying).and_return false
      allow(plane).to receive(:landed).and_return true
    end

    it 'instructs plane to take off' do
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end

    it 'docks plane in hangar' do
      subject.land(plane)
      expect(subject.hangar).to eq [plane]
    end

    it 'stops plane from taking off in stormy weather' do
      subject.land(plane)
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
      expect{subject.take_off(plane)}.to raise_error 'Too stormy to take off!'
    end

    it 'stops plane taking off from another airport'

  end

  describe '#capacity' do

    it 'sets airport capacity' do
      airport = Airport.new(30)
      expect(airport.capacity).to eq 30
    end

  end
end

end
