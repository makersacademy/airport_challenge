require_relative '../lib/weather'

describe Weather do 
  describe '#random_selector' do 
    it 'checks random_selector return a number' do 
      expect(subject.random_selector).to be_a_kind_of(Integer)
    end 
  end 
  describe '#weather' do 
    it 'checks weather function works correctly' do 
      allow_any_instance_of(Object).to receive(:rand).with(7).and_return(1)
      expect(subject.weather).to eq "CLEAR_SKIES"
    end 
  end 

end 
