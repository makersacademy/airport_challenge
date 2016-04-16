require 'airport'

describe Airport do

  let(:weather) {double(:weather)}


  describe '#land' do

    #I want to instruct a plane to land at an airport and confirm that it has landed
    it 'instructs a plane to land' do
      plane = Plane.new
      subject.land(plane)
    end

    it 'has the plane after landing' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes).to include plane

    end

    #I want to prevent landing when weather is stormy
    # it 'prevents landing when weather is stormy' do
    # allow(weather).to receive(:weather_generator) { 8 }
    #   plane = Plane.new
    #   message = "Too stormy to land"
    #   expect { subject.land(plane) } .to raise_error message
    # end

    #I want to prevent landing when the airport is full
    it 'prevents landing when airport is full' do
      plane1 = Plane.new
      plane2 = Plane.new
      plane3 = Plane.new
      #subject.capacity.times { subject.land(plane) } cannot run this now, as we will get the error "Plane already landed"
      subject.land(plane1)
      subject.land(plane2)
      message = "Airport full"
      expect{subject.land(plane3)}.to raise_error message
    end

    it 'a plane that has landed cannot land again' do
      plane = Plane.new
      subject.land(plane)
      message = "Plane already landed"
      expect { subject.land(plane) } .to raise_error message
    end


  end

  describe '#take_off' do

    #I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
    it 'instructs a plane to take off' do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
    end

    it 'does not have the plane after take off' do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).to_not include plane
    end

    it 'a plane can only take off from an airport it is in' do
      plane1 = Plane.new
      plane2 = Plane.new
      subject.land(plane2)
      message = "Plane not at airport"
      expect { subject.take_off(plane1) } .to raise_error message
    end

    #I want to prevent takeoff when weather is stormy
    it 'prevents take off when weather is stormy' do

    end

    it 'prevents take off when airport is empty' do
      plane = Plane.new
      message = "Airport empty"
      expect { subject.take_off(plane) } .to raise_error message
    end


  end

end
