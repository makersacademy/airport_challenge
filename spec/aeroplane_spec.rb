require 'aeroplane'

describe Aeroplane do
  it "has a grounded/airborne status" do
    expect(subject.status).to eq('grounded').or eq 'airborne'
  end

  it "has .location" do
    expect(subject.location).to eq(nil).or be_an(Airport) 
  end
end
