require 'plane'

describe Plane do 

  describe 'a plane that flies' do
    it 'responds to flying' do 
      expect(subject).to respond_to :flying?
    end

  end
end 