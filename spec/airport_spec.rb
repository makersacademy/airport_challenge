require 'airport'

describe Airport do

  describe '#land' do 
    it { is_expected.to respond_to :land }

    it 'Should not let planes land when airport is full' do
      Airport::DEFAULT_CAPACITY.times do subject.land(double) end
      expect { subject.land double }.to raise_error 'Airport full'
    end
  end


  describe '#take_off' do
    it { is_expected.to respond_to :take_off }

    it 'Should let plane take off and confirm it is no longer in the airport' do
    
    end
  end

  it { is_expected.to respond_to :full?}

  it { is_expected.to respond_to :capacity}

  it 'Should have a default capacity that can be overwritten as appropriate' do

  end
  
  it 'Should prevent landing when weather is stormy' do

  end

  it 'Should prevent take off when weather is stormy' do

  end

  
end
  