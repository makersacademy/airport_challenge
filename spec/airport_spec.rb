require 'airport.rb'

describe Airport do
  it 'can land a plane when sunny' do
    # Arrange
    plane = double(:plane)
    weather = double(:weather, :status => 'sunny')
    # Act
    subject.weather = weather.status
    subject.land_plane(plane)
    # Assert
    expect(subject.hanger).to include(plane)
  end

  it 'can get a plane to take off when sunny' do
    # Arrange
    plane = double(:plane)
    weather = double(:weather, :status => 'sunny')
    # Act
    subject.weather = weather.status
    subject.land_plane(plane)
    subject.take_off_plane(plane)
    # Assert
    expect(subject.hanger).to_not include(plane)
  end

  it 'can prevent planes from landing when hanger is full' do
    # Arrange
    plane = double(:plane)
    weather = double(:plane, :status => 'sunny')
    # Act
    subject.weather = weather.status
    subject.capacity.times { subject.land_plane plane }
    # Assert
    expect { raise subject.land_plane(plane) }.to raise_error 'Hanger is full.'
  end

  it 'can prevent take off when weather is stormy' do
    # Arrange
    plane = double(:plane)
    weather = double(:weather, :status => 'stormy')
    # Act
    subject.weather = weather.status
    # Assert
    expect { raise subject.take_off_plane(plane) }.to raise_error 'Unsuitable take off conditions.'
  end

  it 'can prevent landing when weather is stormy' do
    # Arrange
    plane = double(:plane)
    weather = double(:weather, :status => 'stormy')
    # Act
    subject.weather = weather.status
    # Assert
    expect { raise subject.land_plane(plane) }.to raise_error 'Unsuitable landing conditions.'
  end

  describe 'DEFAULT_CAPACITY' do
    it 'can set a DEFAULT_CAPACITY' do
      # Assert
      expect(subject.capacity).to eq(20)
    end

    it 'can override DEFAULT_CAPACITY' do
      # Act
      subject.capacity = 5
      # Assert
      expect(subject.capacity).to eq(5)
    end
  end
end
