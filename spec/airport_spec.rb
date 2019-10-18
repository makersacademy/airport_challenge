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
        weather = double(:weather, :stormy? => false)
        
        planes.each { |plane| subject.land_plane(plane, weather) }

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
        good_weather = double(:weather, :stormy? => false)
        bad_weather = double(:weather, :stormy? => true)
        
        planes.each { |plane| subject.land_plane(plane, good_weather) }

        # Assert 
        expect{ subject.take_off(planes[1], bad_weather) }.to raise_error "You cannot take off. Weather is stormy"
    end

    it 'should not allow planes to land when stormy' do 
        # Arrange
        plane = double(:plane)
        weather = double(:weather, :stormy? => true)
 
        # Assert
        expect(subject.planes.length).to be 0
        expect{ subject.land_plane(plane, weather) }.to raise_error "You cannot land. Weather is stormy"
    end

    it 'should not allow planes to land if airport is full' do
        # Arrange
        plane = double(:plane)
        weather = double(:weather, :stormy? => false)

        20.times { subject.land_plane(plane, weather) }

        # Assert 
        expect{ subject.land_plane(plane, weather) }.to raise_error "You cannot land. The airport is full"
        expect(subject.planes.length).to eq 20  
    end

    it 'should be able to override airport capacity' do 
        # Arrange
        airport = Airport.new(5)
        plane = double(:plane)
        weather = double(:weather, :stormy? => false)

        5.times { airport.land_plane(plane, weather) }

        # Assert 
        expect{ subject.land_plane(plane, weather) }.to raise_error "You cannot land. The airport is full"
        expect(subject.planes.length).to eq 5
    end 
end