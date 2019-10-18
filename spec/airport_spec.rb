require 'airport'

describe Airport do 
    it 'should be an airport' do
        expect(subject).to be_an_instance_of(Airport)
    end

    it 'should instruct planes to land' do 
        # Arrange
        plane = double(:plane)
        weather = double(:weather, :stormy? => false)
        
        # Act
        subject.land_plane(plane, weather)

        # Assert
        expect(subject.planes.length).to be 1
        expect(subject.planes.first).to be plane
    end

    it 'should instruct planes to take off' do 
        # Arrange
        planes = [double(:plane, :flight_number => 1), double(:plane, :flight_number => 2), double(:plane, :flight_number => 3)]
        planes.each { |plane| subject.land_plane(plane) }
        weather = double(:weather, :stormy? => false)

        # Act
        actual = subject.take_off(planes[1], weather)

        # Assert
        expect(actual).to be planes[1]
        expect(actual.flight_number).to be 2
        expect(subject.planes.length).to be 2
    end

    it 'should not allow planes to take off when stormy' do 
        # Arrange
        planes = [double(:plane, :flight_number => 1), double(:plane, :flight_number => 2), double(:plane, :flight_number => 3)]
        planes.each { |plane| subject.land_plane(plane) }
        weather = double(:weather, :stormy? => true)

        # Assert 
        expect{ subject.take_off(planes[1], weather) }.to raise_error "You cannot take off. Weather is stormy"
    end

    it 'should not allow planes to land when stormy' do 
        # Arrange
        plane = double(:plane)
        weather = double(:weather, :stormy? => true)
        
        # Act
        subject.land_plane(plane, weather)
 
        # Assert
        expect(subject.planes.length).to be 0
        expect{ subject.land_plane(plane, weather) }.to raise_error "You cannot land. Weather is stormy"
    end
end