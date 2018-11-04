require 'airport'

describe Airport do

  it 'instruct plane to land at airport' do
    expect(subject.land).to eq 'land'
  end

  it 'instructs plane to take off' do
    expect(subject.take_off).to eq "plane has taken off and no longer at airport"
  end

  it "grounds plane when storm is present" do
    expect(subject.storm).to eq "plane has been grounded due to storm"
  end

  it "prevents plane from landing when storm is present" do
    expect(subject.landing_from_air).to eq "plane cannot land due to storm"
  end


end
