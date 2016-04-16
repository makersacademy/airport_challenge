require 'plane'

describe Plane do 

  describe 'is flying' do
    it 'responds to flying' do 
      expect(subject).to respond_to :flying?
    end

    it 'responds to landed' do 
      expect(subject).to respond_to :landed?
    end

    it 'confirms that it has landed' do 
      subject.confirm_landing
      expect(subject).to be_landed
    end
  end
end 