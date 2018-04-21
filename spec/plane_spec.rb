require 'plane'

describe Plane do
  it 'can create a instance' do
    expect(Plane.new).to be_truthy
  end

  describe '#land' do
    let(:airport) { double('airport', planes: []) }
    it 'can instuct a plane to land in a aiport' do
      is_expected.to respond_to(:land).with(1).argument
    end

    it 'will be in airport stated' do
      subject.land(airport)
      expect(airport.planes).to eq [subject]
    end
  end

  describe '#take_off' do
    let(:airport) { double('airport', planes: [subject]) }
    it 'can instruct a plane to take off at a aiport' do
      is_expected.to respond_to(:take_off).with(1).argument
    end
    it 'will not be in the airport stated after take_off' do
      subject.take_off(airport)
      expect(airport.planes).to eq []
    end
  end

end
