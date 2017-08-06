require './docs/airport.rb'


describe Airport do
  it { is_expected.to respond_to(:take_off).with(1).argument }
  it { is_expected.to respond_to(:landing).with(1).argument }
  it "creates a plane" do
    expect(subject).to respond_to (:create_planes)
end

end

#the plane lands and is back in the airport
describe 'landing planes' do
  it 'instructs the plane to land' do
  expect(plane).to recieve (:landing)
  subject.landing plane
end
  it 'has the plane after it has landed' do
  allow(plane).to recieve(:landing)
  subject.landing plane
  expect(subject.planes). to include plane
  end
end
