require 'weather'

describe Weather do

  it "set status to sunny" do
    # allow(subject).to receive(:set_status) { 'Sunny' }
    stub(:rand) {7}
    expect(subject.set_status).to eq 'Sunny'
  end

  it "set status to stormy" do
    allow(subject).to receive(:set_status) { 'Stormy' }
    expect(subject.set_status).to eq 'Stormy'
  end

end
