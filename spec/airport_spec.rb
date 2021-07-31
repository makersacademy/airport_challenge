require './lib/airport'

describe Airport do
  it { is_expected.to be_instance_of(Airport) }
  
  describe '#land' do
    
    it 'planes can land at an airport' do
      expect(subject).to respond_to(:land).with(1).argument
    end

  end

end
