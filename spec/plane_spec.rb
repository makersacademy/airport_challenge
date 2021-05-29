require 'Plane'

describe Plane do
  it { is_expected.to respond_to(:weather)}
  
  context '#weather' do 
    
    it 'can be sunny or stormy' do
      expect(subject.weather).to eq('sunny').or eq('stormy')
    end
    
    it { subject.class.should be_const_defined(:CHANCE_OF_STORM) }

    it 'may be sunny' do
      # seed with srand(1235)
      srand(1235)
      expect(subject.weather).to eq('sunny')
    end
    
    it 'may be stormy' do
      # seed with srand(1234)
      srand(1234)
      expect(subject.weather).to eq('stormy')
    end  
  end
end
