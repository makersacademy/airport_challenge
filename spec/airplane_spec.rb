require 'airplane'

describe Airplane do 
  describe '.new' do 
    it 'is not in flight when initialised' do 
      expect(subject.in_flight).to be(false)
    end 
  end

  describe '.take_off' do 
    it 'sets @in_flight to true at takeoff' do 
      subject.take_off
      expect(subject.in_flight).to eq(true)
    end 
  end 
end 
