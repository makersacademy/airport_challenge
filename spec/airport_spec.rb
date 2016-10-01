require 'airport'

describe Airport do
  before :example do
    @plane = Plane.new
  end

  describe 'landing and take off' do

    it 'instructs a plane to land at an airport' do
      expect(subject.land(@plane)).to eq [@plane]
    end

    it 'confirms that a plane has landed' do
      subject.land(@plane)
      expect(subject.planes).to eq [@plane]
    end

    it 'instructs a plane to take off' do
      expect(subject).to respond_to(:take_off)
    end

    it 'confirms that a plane has took off' do
      subject.land(@plane)
      expect(subject.take_off).to eq @plane
    end
  end

  describe 'prevents landing and take off at bad weather' do
    let(:weather) { Weather.new }
    it 'prevents planes to take off in stormy weather' do
      expect(weather).to be_stormy?
    end

  end
end
