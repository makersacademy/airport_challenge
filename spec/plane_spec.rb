require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { double(:airport, :capacity => 10, :planes => [plane], :stormy? => false, :full? => false) }
  let(:stormy_airport) { double(:airport, :capacity => 100, :planes => [plane], :stormy? => true, :full? => false) }
  let(:full_airport) { double(:airport, :capacity => 1, :planes => [plane], :stormy? => false, :full? => true) }

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }
  it { is_expected.to respond_to(:status) }

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
      expect { plane.take_off(stormy_airport) }.to raise_error 'The weather is too stormy for take off right now.'
    end
    it 'should throw error message if plane is not at that airport' do
      plane.take_off(airport)
      expect { plane.take_off(airport) }.to raise_error 'This plane is not at that airport!'
    end
  end

  describe '#land' do
    it 'plane should be at airport after landing' do
      plane.land(airport)
      expect(airport.planes).to include plane
      expect(plane.status).to eq "landed at #{airport}"
    end
    it 'should throw error message if weather is stormy' do
      expect { plane.land(stormy_airport) }.to raise_error 'The weather is too stormy for landing right now.'
    end
    it 'should throw error message if airport is full' do
      expect { Plane.new.land(full_airport) }.to raise_error 'This airport is full.'
    end
    it 'should throw error message if plane is not flying' do
      plane.instance_variable_set(:@status, "landed at some_airport")
      expect { plane.land(airport) }.to raise_error 'This plane is not in the air!'
    end
  end

end
