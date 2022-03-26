require 'airport'

describe Airport do

  describe '#land' do 
    it { is_expected.to respond_to :land }

    it 'Should not let planes land when airport is full' do
      Airport::DEFAULT_CAPACITY.times do subject.land(double) end
      expect { subject.land double }.to raise_error 'Airport full'
    end

    it 'Should prevent landing when weather is stormy' do
        weather = double(:stormy? => true)
        plane = double
        expect { subject.land plane}.to raise_error 'Cannot land when stormy'
    end
  end


  describe '#take_off' do
    it { is_expected.to respond_to :take_off }

    it 'Should let plane take off and confirm it is no longer in the airport' do
      subject.land(double)
      subject.take_off
      expect(subject.planes.count).to eq 0
    end

    it 'Should prevent take off when weather is stormy' do
      weather = double(:stormy? => true)
      plane = double
      expect { subject.land plane}.to raise_error 'Cannot take off when stormy'
    end
  
  end

  it { is_expected.to respond_to :full?}


  it 'Should have a default capacity that can be overwritten as appropriate' do
    airport = Airport.new(50)
    expect(airport.capacity).to eq 50
  end
  
end
  