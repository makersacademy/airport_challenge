require 'airport'

describe Airport do
  context 'when a plane is landing' do
    it 'can confirm that 1 plane has landed' do
      subject.confirm_land
      expect(subject.planes.count).to eq 1
    end

    it 'can confirm that a plane has landed and the correct plane is in a slot' do
      expect(subject.confirm_land).to eq subject.planes[-1]
    end

    it 'can confirm that a plane has landed' do
      expect(subject.confirm_land).to eq subject.planes[-1]
    end

    it 'can prevent landing if weather is stormy' do
      ## Arrange
      ## Act
      ## Assert
      expect(subject.confirm_land.STORMY).to raise_error "Plane cannot land, it is too stormy!"
    end
  end

  context 'when a plane is taking off' do
    it 'can confirm that 1 plane has taken off' do
      ## Arrange
      ## Act
      subject.confirm_takeoff
      ## Assert
      expect(subject.confirm_takeoff). to eq subject.planes
    end
  end


end
