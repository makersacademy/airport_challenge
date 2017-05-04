require 'airplane'
require 'airport'

describe Airplane do

  let(:airport) {double(:airport, accept_takeoff: true, accept_landing: true)}

  describe '# takeoff' do
    it {is_expected.to respond_to(:takeoff)}

    it 'should not be landed' do
      subject.takeoff(airport)
      expect(subject.landed?).to be false
    end

  end

  describe '# land' do
    it {is_expected.to respond_to(:land).with(1).argument}

     it 'lands the plane' do
        subject.takeoff(airport)
        subject.land(airport)
        expect(subject.landed?).to be true
     end
  end

  describe '# landed?' do
    it {is_expected.to respond_to(:landed?)}

    it 'should be true on initialization' do
      expect(subject.landed?).to be true
    end

  end

end
