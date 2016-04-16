require 'airport'

describe Airport do

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
    it 'prevents landing when weather is stormy' do

    end

    #I want to prevent landing when the airport is full
    it 'prevents landing when airport is full' do

    end


  end

  describe '#take_off' do

    #I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
    it 'instructs a plane to take off' do

    end

    it 'does not have the plane after take off' do

    end

    #I want to prevent takeoff when weather is stormy
    it 'prevents take off when weather is stormy' do

    end

    it 'prevents take off when airport is empty' do

    end

  end

end
