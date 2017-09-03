 require 'airport'
 require 'weather'
 require 'plane'


describe Airport do


    it 'raises an error when full' do
      subject.plane_land(Plane.new)
      expect { subject.plane_land Plane.new }.to raise_error 'airport is full'
    end


    it 'prevents landing when weather is stormy' do
      subject.plane_land(Plane.new)
      expect { subject.plane_land Plane.new }.to raise_error 'weather is stormy'
    end

#
end
