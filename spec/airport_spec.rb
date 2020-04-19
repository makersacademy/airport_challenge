require './lib/airport.rb'

describe Airport do


  describe "#land" do
    it "plane should be able to #land" do
      expect(subject).to respond_to :land
    end
  end

  it { is_expected.to respond_to :take_off }

  it { is_expected.to respond_to :confirm_location }


  describe '#initialize' do
    it 'with default capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.land
      end
    expect { subject.land }.to raise_error 'WARNING! AIRPORT FULL!'
    end
  end

  describe '#take_off' do
    it "produces warning for zero plane take off cases" do
    expect { subject.take_off }.to raise_error 'WARNING! AIRPORT EMPTY!'
    end
  end


end
