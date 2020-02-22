require 'airport.rb'
require 'plane.rb'

describe Airport do 
  subject(:airport) { described_class.new }
  #subject(:plane) { described_class.new }

  #it { is_expected.to respond_to(:land).with(1).argument } 
  it { expect(subject).to respond_to(:land).with(1).argument } 
  

  it 'instructs a plane to take off from the airport"' do
    expect(subject).to respond_to(:take_off)
  end


   

  
  
    #it 'instructs a plane to take off from the airport' do 
    #expect { subject.take_off(plane).to respond_to :take_off }

end

