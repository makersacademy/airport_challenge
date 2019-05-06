require 'airport'
require 'weather'

describe Airport do

    describe '#land_plane' do
        it 'should land planes at airport' do
            weather = instance_double("Weather", :state => "sunny")
            plane = Plane.new
            subject.land_plane(plane, weather.state)
            expect(subject.airport_array.include?(plane)).to eq(true)
        end

        it 'should prevent landing when weather is stormy' do
            weather = instance_double("Weather", :state => "stormy")
            plane = Plane.new
            subject.land_plane(plane, weather.state)
            expect(subject.airport_array.length).to eq(0)
        end
    end

    describe '#take_off' do
        it 'should allow planes to take off from airport' do
            weather = instance_double("Weather", :state => "sunny")
            plane = Plane.new
            subject.land_plane(plane, weather.state)
            subject.take_off_plane(plane, weather.state)
            expect(subject.airport_array.include?(plane)).to eq(false)
        end

        it 'should prevent take off when weather is stormy' do
            weather = instance_double("Weather", :state => "stormy")
            plane = Plane.new
            subject.land_plane(plane, weather.state)
            subject.take_off_plane(plane, weather.state)
            expect(subject.airport_array.length).to eq(0)
        end
    end

    describe '#full?' do
        it 'raises an error when capacity is reached' do
            weather = instance_double("Weather", :state => "sunny")
            subject.CAPACITY.times { subject.land_plane(Plane.new, weather.state) }
            expect { subject.land_plane(Plane.new, weather.state) }.to raise_error('cannot land plane, capacity exceeded')
        end   
    end
end