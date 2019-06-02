require 'airport'

RSpec.describe Airport do
  it { is_expected.to respond_to :land_plane }
  
  describe '#land_plane' do 
    it 'lands a plane' do
      planes = Planes.new
      subject.apron(planes)
      expect(subject.land_plane).to eq [planes]
    end
  end

  it { is_expected.to respond_to(:apron).with(1).argument }
#	 it { is_expected.to respond_to(:planes) }
  describe '#apron' do
    it 'returns planes to apron' do 
      planes = Planes.new
      subject.apron(planes)
      expect(subject.planes).to eq [planes]
    end

    it 'raises an error when airport is full' do
      subject.capacity.times { subject.apron double :planes }
      expect { subject.apron double(:planes) }.to raise_error 'Airport is full'
    end

    it 'raise an error when there are no planes to take off' do
      expect { subject.take_off }.to raise_error 'All planes departed'
    end
  end
  
  describe 'initialization' do
    subject { Airport.new }
    let(:planes) { Planes.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.apron(planes)
      end
      expect { subject.apron(planes) }.to raise_error 'Airport is full'
    end

#  it 'has a default capacity' do
#     expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
#  end

#    it 'has variable capacity' do
#      airport = Airport.new(5)
#      5.times { airport.apron(Planes.new) }
#      expect { airpot.apron(Planes.new) }.to raise_error 'Airport is full'
#    end

#    Airport::DEFAULT_CAPACITY.times do
#      it 'raises an error when airport full' do
#        subject.capacity.times { subject.apron Planes.new } 
#        expect { subject.apron Planes.new }.to raise_error 'Airport is full'
#      end
#    end

  end
end
