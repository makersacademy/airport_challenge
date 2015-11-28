require 'plane'

describe Plane do

  describe 'plane status' do
    it{is_expected.to respond_to  :landed?}

    it{is_expected.to respond_to :in_flight}

    it 'should be landed when it touches down' do
      subject.in_flight
      subject.touch_down
      expect(subject).to be_landed
    end

    it 'should not be landed when in flight' do
      subject.in_flight
      expect(subject).to_not be_landed
    end


  end

end
