require 'weather'

describe Weather do
  subject { Weather.new }

  it "can create instance of Weather" do
    expect(subject).to be_instance_of Weather
  end

  it 'Can return sunny when randomly choosing weather' do
    subject.stub(:generate_random_number) {5}
    expect(subject.status).to eq "Sunny"
  end

  it "can return stormy when randomly choosing weather" do
    subject.stub(:generate_random_number) {9}
    expect(subject.status).to eq "Stormy"
  end

end
