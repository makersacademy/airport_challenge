require './lib/airport'

describe Airport do
  it { is_expected.to be_instance_of(Airport) }
  
  describe '#land' do
    
    it 'planes can land at an airport' do
      expect(subject).to respond_to(:land).with(1).argument
    end

  end

  describe '#take_off' do
    
    it 'planes can take_off from an airport' do
      expect(subject).to respond_to(:take_off)
    end

  end



end
