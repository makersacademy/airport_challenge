require 'airport'
describe Airport do
  
  describe '#land' do
    it 'expects a new instance of the class to respond to the land method' do
      expect { subject.to respond_to(:land)}
    end
  end


end