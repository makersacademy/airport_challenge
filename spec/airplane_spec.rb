require 'airplane'

describe Airplane do 
  describe '.new' do 
    it 'is not in flight when initialised' do 
      expect(subject.in_flight).to be(false)
    end 
    it 'location is unnasigned by default' do
      expect(subject.location).to be('unassigned')
    end 
  end 
end 