require 'weather'

describe Weather do 
  describe '.new' do 
    it 'initialises with a weather string' do 
      expect(subject.current).to be_a(String)
    end
  end
end 