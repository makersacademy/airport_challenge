require 'airport'

describe Airport do

  
  context 'So I can get passengers to a destination' do 

    it 'Checks if the airport can land planes' do
      expect(subject).to respond_to(:landing)
    end
  end

  context 'So I can get passengers on the way to their destination' do
    
    it 'Instructs a plane to take off and confirm that it is no longer in the airport' do
      expect(subject).to respond_to(:take_off).with(1).argument
      plane = Plane.new
      subject.landing(plane)
      expect(subject.take_off(plane)).to eq "Plane has taken off"
    end
  end

end