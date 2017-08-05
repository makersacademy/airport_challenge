require './docs/airport.rb'


describe Airport do
  it { is_expected.to respond_to(:take_off).with(1).argument }
  it { is_expected.to respond_to(:landing).with(1).argument }
  it "creates a plane" do
    expect(subject).to respond_to (:create_planes)
end

end 
