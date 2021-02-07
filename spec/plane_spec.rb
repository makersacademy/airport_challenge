require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { double(:airport, :capacity => 10, :planes => [plane], :stormy? => false, :full? => false) }
  let(:stormy_airport) { double(:airport, :capacity => 10, :planes => [plane], :stormy? => true, :full? => false) }
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

  describe 'feature test for a number of planes taking off and landing' do
    let(:heathrow) { double(:airport, :capacity => 10, :planes => [], :stormy? => false, :full? => false) }
    let(:gatwick) { double(:airport, :capacity => 10, :planes => [], :stormy? => false, :full? => false) }
    let(:stansted) { double(:airport, :capacity => 10, :planes => [plane], :stormy? => true, :full? => false) }
    let(:luton) { double(:airport, :capacity => 10, :planes => [described_class.new], :stormy? => false, :full? => true) }

    let(:plane1) { described_class.new.land(heathrow) }
    let(:plane2) { described_class.new.land(heathrow) }
    let(:plane3) { described_class.new.land(heathrow) }
    let(:plane4) { described_class.new.land(heathrow) }
    let(:plane5) { described_class.new.land(heathrow) }
    let(:plane6) { described_class.new.land(heathrow) }
    let(:plane7) { described_class.new.land(heathrow) }
    let(:plane8) { described_class.new.land(heathrow) }
    let(:plane9) { described_class.new.land(heathrow) }
    let(:plane10) { described_class.new.land(heathrow) }

    it 'should meet the following expectations' do
      expect(plane1.status).to eq "landed at #{heathrow}"
      expect { plane1.take_off(gatwick) }.to raise_error 'This plane is not at that airport!'
      plane1.take_off(heathrow)
      expect(heathrow.planes).not_to include(plane1)
      expect(plane1.status).to eq 'flying'
      expect { plane1.take_off(heathrow) }.to raise_error 'This plane is not at that airport!'
      expect { plane1.land(stansted) }. to raise_error 'The weather is too stormy for landing right now.'
      expect { plane.take_off(stansted) }. to raise_error 'The weather is too stormy for take off right now.'
      plane1.land(gatwick)
      expect(plane1.status).to eq "landed at #{gatwick}"
      plane2.take_off(heathrow).land(gatwick)
      plane3.take_off(heathrow).land(gatwick)
      plane4.take_off(heathrow).land(gatwick)
      plane5.take_off(heathrow).land(gatwick)
      expect(gatwick.planes).to eq [plane1, plane2, plane3, plane4, plane5]
      expect(heathrow.planes).to eq [plane6, plane7, plane8, plane9, plane10]
      plane6.take_off(heathrow)
      expect { plane6.land(luton) }.to raise_error 'This airport is full.'
      expect { plane6.take_off(luton) }.to raise_error 'This plane is not at that airport!'
      expect(plane6.status).to eq "flying"
    end
  end

end
