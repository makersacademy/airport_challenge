require 'airport'
describe Airport do
  it 'creates an instance of Airport' do
    expect(subject).to be_instance_of Airport
  end
  it { is_expected.to respond_to :land }

  it { is_expected.to respond_to :take_off }

  it 'Has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe '#land' do
    let(:plane)  { double :plane }
    it 'returns landed planes' do
      expect(subject.land(plane)).to eq plane
    end

    it 'raises an error if the airport is full' do

        subject.capacity.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error 'airport is full'
    end

   
  end

  describe '#take_off' do
    let(:plane)  { double :plane }
    it 'allows a plane to take off' do
        
        subject.land(plane)
        expect(subject.take_off).to eq plane
    end

    it 'plane will not be in the airport' do
        
        subject.land(plane)
        subject.take_off
        expect(subject.planes).not_to include plane
    end

   
  end
end
