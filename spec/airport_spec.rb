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
    it 'raise an error message and prevent landing when airport capacity is full' do
      Airport::DEFAULT_CAPACITY.times { subject.land(double("plane")) }  
      expect { subject.land(double("plane")) }.to raise_error "Airport full, landing not possible." 
    end
    it 'raises an error if a plane that is already in the airport is attempted to be landed' do
      plane = double
      expect { 2.times { subject.land(plane) } }.to raise_error "This plane is already in the airport."
    end
    # it 'should not allow a plane to land if the weather is stormy' do   
  end

  describe '#take_off' do 
    it 'should respond to take_off' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
    it 'should give confirmation that the plane has taken off' do
      double("plane")
      expect(subject.take_off(double)).to eq "#{double} has successfully taken_off from #{subject}."
    end
    it 'should remove the plane that has taken off from the planes_in_airport array' do 
      double("plane")
      subject.land(double)
      subject.take_off(double)
      expect(subject.planes_in_airport).not_to include(double)
    end
  end

  # describe '#full?' do 
  #  it 'give an error when trying to land a plane at an airport that is full'
  #    expect()

end    
