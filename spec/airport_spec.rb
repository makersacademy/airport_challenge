require 'airport'

RSpec.describe Airport do

  # As an air traffic controller 
  # So I can get passengers to a destination 
  # I want to instruct a plane to land at an airport
  # describe '#land' do
    it { is_expected.to respond_to(:land) }  

  # end
  
  it "can instruct a plane to land at an airport" do
    expect(subject.land).to eq(@plane)
  end

end