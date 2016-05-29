require 'dispatcher.rb'

describe Dispatcher do

  context 'In any context' do
    it 'responds to :travel_allowed?' do
      expect(subject).to respond_to(:travel_allowed?)
    end 
  end 

  context 'When weather conditions are bad' do
    
    it ':travel_allowed? raises an error' do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
      expect{subject.travel_allowed?}.to raise_error('Travel not allowed due to weather conditions')
    end  
  end 
end
