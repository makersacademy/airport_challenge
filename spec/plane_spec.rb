require 'plane'

describe Plane do

  subject(:plane) { described_class.new }
  let(:airport) { double :airport }

  it 'creates a new instance' do
    expect(subject).to be_a Plane
  end

  # describe 'landed' do
  #   it "responds to #landed?" do
  #     expect(subject).to respond_to(:landed?)
  #   end

  #   it 'should return true if a plane has landed' do
  #     expect(subject.landed?).to eq true
  #   end
  # end
end
