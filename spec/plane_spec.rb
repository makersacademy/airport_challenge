require 'plane'

describe Plane do
subject(:plane) { described_class.new }
let(:airport) { double(:airport, :title => "heathrow", :capacity => 100, :planes => [plane], :stormy? => false, :full? => false) }
let(:stormy_airport) { double(:airport, :title => "storm_city", :capacity => 100, :planes => [plane], :stormy? => true, :full? => false) }
let(:full_airport) { double(:airport, :title => "plane_city", :capacity => 1, :planes => [plane], :stormy? => false, :full? => true) }

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }
  it { is_expected.to respond_to(:status)}

  it "should have status of unassigned when new" do
    expect(plane.status).to eq "unassigned"
  end


  describe '#take_off' do
    it 'should leave airport when it has been told to take_off' do
      plane.take_off(airport)
      expect(airport.planes).not_to include plane
      expect(plane.status).to eq "flying"
    end
    it 'should throw error message if weather is stormy' do
      expect{ plane.take_off(stormy_airport) }.to raise_error 'The weather is too stormy for take off right now.'
    end
  end

  describe '#land' do
    it 'plane should be at airport after landing' do
    plane.land(airport)
    expect(airport.planes).to include plane
    expect(plane.status).to eq "landed at #{airport.title}"
    end
    it 'should throw error message if weather is stormy' do
      expect{ plane.land(stormy_airport) }.to raise_error 'The weather is too stormy for landing right now.'
    end
    it 'should throw error message if airport is full' do
      expect{ Plane.new.land(full_airport) }.to raise_error 'This airport is full.'
    end
  end

end
