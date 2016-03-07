require 'airplane'

describe Airplane do

  describe 'plane_status' do

    it 'should not be landed when a new plane is initialized' do
      expect(subject.landed).to eq false
    end
    
  end

end
