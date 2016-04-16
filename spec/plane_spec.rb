require 'plane'

describe Plane  do

  describe 'landed?' do
    it 'has a landed status' do
      expect(subject.landed?).to eq true
    end
  end

end