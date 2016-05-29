require 'dispatcher.rb'

describe Dispatcher do

  context 'In any context' do
    it 'responds to :travel_allowed?' do
      expect(Dispatcher).to respond_to(:travel_allowed?)
    end 
  end 

  context 'When weather conditions are bad' do
    it ':travel_allowed? raises an error' do
      expect{Dispatcher.travel_allowed?}.to raise_error('Vehicle release denied due to weather conditions')
    end  
  end 
end
