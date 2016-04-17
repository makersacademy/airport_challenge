require 'airport'
require 'weather'
describe Airport do

  let(:plane) { double :plane }

  it {is_expected.to respond_to :planes}

  describe 'initialization' do
    it 'sets default capacity' do
      subject.capacity.times { subject.land(plane) }
      expect{ subject.land(plane) }.to raise_error 'The airport is full'
    end
  end

  describe '#land' do
    it {is_expected.to respond_to(:land).with(1).argument}
    it 'allows planes to land' do
      expect(subject.land(plane)).to eq [plane]
    end
    it 'raises an error when trying to land in a full airport' do
      subject.capacity.times {subject.land(plane)}
      expect {subject.land(plane)}.to raise_error "The airport is full"
    end
  end

  describe '#take_off' do
    it {is_expected.to respond_to(:take_off).with(1).argument}
    it 'raises an error when trying to take off from an empty airport' do
      expect {subject.take_off(plane)}.to raise_error "No planes at the airport"
    end
    it 'raises an error when the weather is too bad for flying' do
      weather = double(:weather, stormy?: true)
      allow(subject).to receive(:stormy?).and_return(true)
      subject.land(plane)
      expect { subject.take_off(plane)}.to raise_error "Bad weather for flying"
    end
  end
end
