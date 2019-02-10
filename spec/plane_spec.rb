require 'plane.rb'
describe Plane do
  it { is_expected.to respond_to :plane_landed }
  it 'checks whether the plane flying if landed' do
    plane = Plane.new
    plane.plane_flying?
    expect(plane.plane_flying?).to eq true
  end
end
