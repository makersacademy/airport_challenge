require 'airplane'
require 'airport'

describe Airplane do

  describe '# takeoff' do
    it {is_expected.to respond_to(:takeoff)}

    it 'should not be landed' do
      subject.takeoff
      expect(subject.landed?).to be false
    end

  end

  describe '# land' do
    it {is_expected.to respond_to(:land).with(1).argument}

     it 'lands the plane' do
        subject.takeoff
        airport = Airport.new
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

#airplane = Airplane.new
#airplane.landed? # true
#airplane.take_off
#airplane.landed? #false
#airplane.land
#airplane.landed? #true


#it 'lands the plane' do
#  airplane = Airplane.new
#  airplane.land
#  expect(airplane.landed?).to be true
# end
