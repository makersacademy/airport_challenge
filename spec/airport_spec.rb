require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  subject(:plane) { described_class.new }

  it 'checks a new instance can be instanciated' do
    expect(airport).to be_instance_of Airport
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).arguments } 

    it "should prevent landing if airport is full" do
      20.times { airport.land(plane) }
      expect {airport.land(plane) }.to raise_error "Airport full"
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off)}

    it 'should return message that plane has taken off' do
      expect(airport.take_off).to include("Plane has taken off")
    end

    # it 'should confirm plane has departed' do
    #   expect { airport.take_off }.to raise_error "Airport empty"
    # end
  end
end