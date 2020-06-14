require 'plane.rb'

describe 'Plane' do
  let(:plane) { Plane.new }

  it "creates an instance of the Plane class" do
    expect(plane).to be_an_instance_of(Plane)
  end

end
