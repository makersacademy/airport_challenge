require 'airport'

RSpec.describe Airport do

  context 'when a default airport is initialised' do
    it { is_expected.to respond_to(:land).with(1).argument }
    it { is_expected.to respond_to(:take_off) }
  end

  context 'when an airport has a plane landed in sunny weather'
  before(:each) do
    @airport = described_class.new
    allow(@airport).to receive(:bad_weather?) { nil }
    @plane = Plane.new
    @airport.land(@plane)
  end
    it { expect(@airport.hanger[0]).to be_a(Plane) }
    it { expect(@airport.take_off).to be @plane }

  context 'confirm plane has left airport in sunny weather' do
  before(:each) do
    @airport = described_class.new
    allow(@airport).to receive(:bad_weather?) { nil }
    @plane = Plane.new
    @airport.land(@plane)
    @airport.take_off
  end
    it { expect(@airport.hanger).not_to include @plane }
  end

  context 'when stormy weather' do
  before(:each) do
    @airport = described_class.new
    allow(@airport).to receive(:bad_weather?) { true }
  end
    it { expect { @airport.take_off }.to raise_error("Too stormy for take off") }
    it { expect { @airport.land(Plane.new) }.to raise_error("Too stormy for landing") }
  end

  # context 'when sunny weather' do
  # before(:each) do
  #   @airport = described_class.new
  #   allow(@airport).to receive(:unsafe_to_fly?) { nil }
  # end
  #
  # end
end
