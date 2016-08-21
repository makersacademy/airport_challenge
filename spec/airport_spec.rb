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

  describe '#land' do

    it 'instructs plane to land' do
      plane = double(:plane, :landed => false)
      expect(subject.land(plane)).to eq [plane]
    end

    it 'docks plane in hangar' do
      plane = double(:plane, :flying => false, :landed => true)
      subject.land(plane)
      expect(subject.hangar).to eq [plane]
    end

    it 'stops plane from landing in stormy weather' do
      plane = double(:plane, :landed => false, :flying => true)
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
      expect{subject.land(plane)}.to raise_error 'Too stormy to land!'
    end

    it 'stops plane from landing if airport is full'
    it 'plane can\t land if already at airport'
    it 'plane can\t land if at another airport'

  describe '#take_off' do

    it 'instructs plane to take off' do
      plane = double(:plane, :flying => false, :landed => true)
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end

    it 'stops plane from taking off in stormy weather' do
      plane = double(:plane, :landed => true, :flying => false)
      subject.land(plane)
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
      expect{subject.take_off(plane)}.to raise_error 'Too stormy to take off!'
    end

    it 'plane can\t take off if already flying'
    it 'plane can\t take off from another airport'

  end

  describe '#capacity' do

    it 'sets default airport capacity'
    it 'allows default airport capacity to be overridden'

  end
end

end
