require 'plane'

describe Plane do
subject(:plane) { described_class.new }
let(:airport) { double(:airport, :title => "heathrow", :planes => [plane]) }

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }
  it { is_expected.to respond_to(:status) }

  it "should have status of unassigned when new" do
    expect(plane.status).to eq "unassigned"
  end


  describe '#take_off' do
    it 'plane should leave airport when it has been told to take_off' do
    plane.take_off(airport)
    expect(airport.planes).not_to include plane
    expect(plane.status).to eq "flying"
    end
  end

  describe '#land' do
    it 'plane should be at airport after landing' do
    plane.land(airport)
    expect(airport.planes).to include plane
    expect(plane.status).to eq "landed at #{airport.title}"
    end
  end

end
