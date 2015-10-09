require 'plane'

describe Plane do
  airport = Airport.new

  it 'Plane is flying when created' do
    expect(subject).to be_flying
  end

  it 'Plane can respond to land' do
    expect(subject).to respond_to(:land)
  end

  it 'Plane can take off' do
    expect(subject).to respond_to(:take_off)
  end

  context "when landed at an airport" do
    before { allow(airport).to receive(:weather).and_return "sunny" }

    it 'the plane is landed' do
      airport.land_plane(subject)
      expect(subject.flying?).to eq false
    end

    it 'expects land to set a plane\'s flying status to false' do
      subject.land
      expect(subject.flying?).to eq(false)
    end

    it 'Plane is flying after take off' do
      subject.take_off
      expect(subject.flying?).to eq(true)
    end

  end

end
