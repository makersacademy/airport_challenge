require './lib/plane'

describe Plane do
  
  it "changes status fo planes after landing" do
    expect(subject.landed).to eq false
  end

end
