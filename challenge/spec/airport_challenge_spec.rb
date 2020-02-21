require 'airport_challenge'

describe 'Airport' do
  it 'can create an instance of class Airport' do
    subject = Airport.new
    expect(subject).to be_a Airport
  end

  describe 'land' do
    it 'can land a plane' do
      subject = Airport.new
      plane = Plane.new
      subject.land(plane)
      expect(subject).to respond_to(:land)
    end
  end

  describe 'take off' do
    it 'can take off and confirm there is no longer in the airport' do
      subject = Airport.new
      subject.take_off
      expect(subject).to respond_to(:take_off)
    end
  end

end
