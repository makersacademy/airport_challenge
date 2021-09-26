require 'plane'
require 'airport'

describe Plane do
  it { is_expected.to respond_to :landing? }

  it 'instructs the plane to delay landing if the weather is stormy' do
    plane = subject.landing?
    expect(plane).to eq "Landing delayed" if @weather == 'stormy'
  end

  it 'instructs the plane to land' do
    plane = subject.landing?
    expect(plane).to eq "Proceed to landing." if @weather == 'sunny'
  end
end