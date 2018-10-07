require 'plane'

describe Plane do
  context 'Not Airborn' do
    it "has a constant NOT_AIRBORN, which is the string, 'Plane is not airborn'" do
      expect(Plane::NOT_AIRBORN).to eq 'Plane is not airborn'
    end
  end

  context 'Is airborn' do
    it "has a constant IS_AIRBORN, which is the string, 'Plane is not airborn'" do
      expect(Plane::IS_AIRBORN).to eq 'Plane is airborn'
    end
  end

  context 'Airborn' do
    it "has a constant Airborn, which is the string, 'airborn'" do
      expect(Plane::AIRBORN).to eq :airborn
    end
  end
  context '#location' do
    it 'has default location, and it is set to airborn' do
      expect(Plane::DEFAULT_LOCATION).to eq Plane::AIRBORN
    end
    it 'is airborn initially' do
      expect(subject.location).to eq Plane::AIRBORN
    end
  end

  context '#location=' do
    it "sets the plane's location" do
      location = :location
      subject.location = location
      expect(subject.location).to eq location
    end
  end

end
