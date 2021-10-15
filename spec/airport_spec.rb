require 'airport'

describe Airport do

  describe '#instruct_to_land' do 
  
    it 'can instruct an airplane to land' do 
      plane = double("plane")
      expect(subject).to respond_to(:instruct_to_land).with(1).argument
    end
  
  end

end
