require 'airport'
describe Airport do

  describe '#initialize' do
    it 'should allow a capacity to be set when an aiport is created' do
      expect(Airport.new(10)).to be_truthy
    end
  end

  describe '#land' do
    it 'should respond to land' do
      expect(subject).to respond_to(:land).with(1).argument
    end
  end

  describe '#take_off' do 
    it 'should respond to take_off' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
    it 'should give confirmation that the plane has taken off' do
      plane = Plane.new
      expect(subject.take_off(plane)).to eq "#{plane} has successfully taken_off from #{subject}."
    end
  end

  #describe '#full?' do 
  #  it 'give an error when trying to land a plane at an airport that is full'
  #    expect()

end    
