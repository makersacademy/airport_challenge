require './lib/airport'

describe Airport do
  
  it "verifies Airport exists" do
    expect(subject).to be_a(Object)
  end

  it "instructs a plane to land" do
    expect(Airport.new.land).to eq(landed)
  end

end