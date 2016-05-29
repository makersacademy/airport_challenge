require 'airport'

describe Airport do

  let (:plane) {double(:plane)}

  it 'allows a plane to land' do
    expect(subject).to respond_to :land
  end

  it 'accepts an argument' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'allows a plane to take off' do
    expect(subject).to respond_to :take_off
  end

  describe '#land' do
    it 'cannot allow plane to land if airport full' do
      allow(plane).to receive(:in_air?).and_return(true)
      allow(plane).to receive(:on_ground).and_return(false)
      Airport::DEFAULT_CAPACITY.times{subject.land(plane)}
      expect {subject.land(plane)}.to raise_error("The airport is at full capacity.")
    end
    it 'cannot land place when already landed' do
      allow(plane).to receive(:in_air).and_return(false)
      expect {subject.land(plane)}.to raise_error("You already landed, silly.")
    end
    it 'cannot land plane when stormy' do
      expect {subject.land(plane)}.to raise_error("The weather is too stormy to land!")
    end
  end

  describe '#take_off' do
    it 'cannot take off if airport is empty' do
      expect {subject.take_off}.to raise_error("There are no planes at the airport.")
    end
    it 'cannot take off if plane already airborne' do
      allow(plane).to receive(in_air).and_return(true)
      expect {subject.take_off(plane)}.to raise_error("You already took off, silly.")
    end
    it 'cannot take off when stormy' do
      expect {subject.take_off(plane)}.to raise_error("The weather is too stormy to take off!")
    end
  end

  describe Airport.new do
    it { is_expected.to have_attributes(:capacity => Airport::DEFAULT_CAPACITY) }
    it { is_expected.to have_attributes(:planes => []) }
  end
end

