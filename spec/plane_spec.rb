require 'plane'

RSpec.describe Plane do
  
  it { is_expected.to respond_to(:land) }
  it { is_expected.to respond_to(:take_off) }
  
  it "should initialize Plane as not landed" do
    expect(subject.landed).to eq(false)
  end

end
