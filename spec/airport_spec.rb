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
        allow(subject).to receive(:weather) { false }  
      Airport::DEFAULT_CAPACITY.times { subject.land(double("plane")) }  
      expect { subject.land(double("plane")) }.to raise_error "Airport full, landing not possible." 
    end
    it 'raises an error if a plane that is already in the airport is attempted to be landed' do
      allow(subject).to receive(:weather) { false }  
      plane = double
      expect { 2.times { subject.land(plane) } }.to raise_error "This plane is already in the airport."
    end
    it 'should not allow a plane to land and raises an error if the weather is stormy' do       
    double("plane")
    allow(subject).to receive(:weather) { true } 
    expect { subject.land(double) }.to raise_error "Cannot enable take-off / landing during stormy weather"
    end
  end

  describe '#take_off' do 
    it 'should respond to take_off' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
    it 'should give confirmation that the plane has taken off' do
      allow(subject).to receive(:weather) { false }   
      double("plane")
      expect(subject.take_off(double)).to eq "#{double} has successfully taken_off from #{subject}."
    end
    it 'should remove the plane that has taken off from the planes_in_airport array' do 
      allow(subject).to receive(:weather) { false }
      double("plane")
      subject.land(double)
      subject.take_off(double)
      expect(subject.planes_in_airport).not_to include(double)
    end
    it 'should not allow a plane to land and raises an error if the weather is stormy' do       
      double("plane")
      allow(subject).to receive(:weather) { true } 
      expect { subject.land(double) }.to raise_error "Cannot enable take-off / landing during stormy weather"
      end
  end

  # describe '#full?' do 
  #  it 'give an error when trying to land a plane at an airport that is full'
  #    expect()

end    
