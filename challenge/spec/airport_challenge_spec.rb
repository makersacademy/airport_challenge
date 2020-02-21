require 'airport_challenge'

describe 'Airport' do
  it 'can create an instance of class Airport' do
    subject = Airport.new
    expect(subject).to be_a Airport
  end

  it 'can have override capacity' do
    subject = Airport.new(30)
    expect(subject.amount_of_planes).to eq(30)
end

  describe '#land' do
    it 'can land a plane' do
      subject = Airport.new
      plane = Plane.new
      subject.land(plane)
      expect(subject).to respond_to(:land)
    end

    it 'can tell air traffic controller that airport is full' do
      subject = Airport.new
      subject.amount_of_planes.times{subject.land double :plane}
      expect {subject.land double (:plane) }.to raise_error(RuntimeError, "Airport is FULL!")
    end

  describe 'take off' do
    it 'can take off and confirm there is no longer in the airport' do
      subject = Airport.new
      subject.take_off
      expect(subject).to respond_to(:take_off)
    end
  end
end
end
