require 'Airport'
require 'Conditions'

describe Airport do

  describe '#land' do
    it 'instructs a plane to land' do
      # Arrange
      plane = Plane.new
      conditions = Conditions.new
      subject = Airport.new(conditions)
      # Act
      # Assert
      expect(subject.land(plane)).to eq(plane)
    end
  end

  describe'#take_off' do
    it 'instructs a plane to take off' do
      # Arrange
      plane = Plane.new
      conditions = Conditions.new
      subject = Airport.new(conditions)
      allow(conditions).to receive(:stormy).and_return false

      # Action incorporated in assertion below
      # Assertion
      expect(subject.take_off(plane)).to eq(plane)
    end
  end
    it 'fails if weather is stormy' do
      # create a new variable equal to a new conditions class (stormy by default)
      conditions = Conditions.new
      # make the stormy method in the above variable evaluate to true
      allow(conditions).to receive(:stormy).and_return true
      # new plane please
      plane = Plane.new
      # set subject to equal a new airport with our defined conditions
      subject = Airport.new(conditions)
      # expect that new airport to raise error and return string
      # because you have set conditions to stormy
      expect{subject.take_off(plane)}.to raise_error "Cannot take off due to stormy weather"
    end
  end
