require 'airport'

describe Airport do

  context '#land' do
    
    it 'responds' do
      expect(subject).to respond_to :land
    end
    it 'expects one argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end
    
  end

end
