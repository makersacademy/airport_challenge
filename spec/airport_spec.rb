require 'airport'
require 'weather'
describe Airport do

  let(:plane) { double :plane }

  it {is_expected.to respond_to :planes}
  it {is_expected.to respond_to(:take_off).with(1).argument}

  describe 'initialization' do
    it 'sets default capacity' do
      allow(subject).to receive(:is_stormy?).and_return(false)
      subject.capacity.times { subject.land(plane) }
      expect{ subject.land(plane) }.to raise_error 'The airport is full'
    end
  end

  describe '#land' do
    it {is_expected.to respond_to(:land).with(1).argument}
    it 'allows planes to land' do
      allow(subject).to receive(:is_stormy?).and_return(false)
      expect(subject.land(plane)).to eq [plane]
    end
    it 'raises an error when trying to land in a full airport' do
      allow(subject).to receive(:is_stormy?).and_return(false)
      subject.capacity.times {subject.land(plane)}
      expect {subject.land(plane)}.to raise_error "The airport is full"
    end

    it 'raises an error when the weather is too bad for flying' do
      allow(subject).to receive(:is_stormy?).and_return(true)
      expect { subject.land(plane)}.to raise_error "Bad weather for flying"
    end
  end

  describe '#take_off' do
    it 'raises an error when trying to take off from an empty airport' do
      expect {subject.take_off(plane)}.to raise_error "No planes at the airport"
    end
    it 'raises an error when the weather is too bad for flying' do
      allow(subject).to receive(:is_stormy?).and_return(false)
      subject.land(plane)
      allow(subject).to receive(:is_stormy?).and_return(true)
      expect { subject.take_off(plane)}.to raise_error "Bad weather for flying"
    end
  end
end
