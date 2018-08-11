require 'airport'

describe Airport do

  it { is_expected.to respond_to(:land) }

  it { is_expected.to respond_to(:land).with(1).argument }

  it "should have somewhere to store instances of planes" do 
    expect(subject.planes).to eq([])
  end

end
