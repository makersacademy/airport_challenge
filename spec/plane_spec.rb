require 'plane'

describe Plane do

  describe 'attributes:' do
    it 'expect plane to be landed' do
      expect(subject.land).to eq true
    end

    it 'expect plane to be taken off' do
      expect(subject.take_off).to eq false
    end
  end

  describe 'responds to:' do
    it 'responds to land' do
      expect(subject).to respond_to :land
    end

    it 'responds to take off' do
      expect(subject).to respond_to :take_off
    end
  end

end
