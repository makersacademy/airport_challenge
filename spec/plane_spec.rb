require 'plane'

describe Plane do

subject(:plane) { described_class.new }

  it { is_expected.to respond_to(:flying) }
  it { is_expected.to respond_to(:landed) }
  it { is_expected.to respond_to(:flying?) }

context 'when flying:' do

  it "status is 'flying' and location is 'air'" do
    plane.flying
    expect(plane).to have_attributes(status: :flying, location: :air)
  end
end

context 'when landed:' do

  it "status is 'landed' and location is 'airport'" do
    plane.landed
    expect(plane).to have_attributes(status: :landed, location: :airport)
  end
end

context '#flying? returns:' do

  it  "'true' when plane is flying" do
    plane.flying
    expect(plane.flying?).to eq true
  end

  it "'false' when plane has landed" do
    plane.landed
    expect(plane.flying?).to eq false
  end
end
end
