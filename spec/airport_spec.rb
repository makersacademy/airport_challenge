require 'airport'

describe Airport do
  let(:weather_report) {double :WeatherReport}
  plane = Plane.new
  #airway_not_clear = allow(subject).to receive(:gets).and_return("no")

  #let(:plane) {double :Plane}
  it { is_expected.to respond_to :safe_conditions?}
  it { is_expected.to respond_to :land_plane }
  it { is_expected.to respond_to :plane_depart }
  it { is_expected.to respond_to :clear? }
  it { is_expected.to respond_to :full?}

  it 'allows a plane to land if conditions are all clear' do
    allow(weather_report).to receive(:weather_conditions){"clear"}
    expect(weather_report.weather_conditions).to eq("clear")
    allow(subject).to receive(:gets).and_return("yes")
    expect(subject.clear?).to be(true)
    expect(subject.land_plane(plane)).to be(true)
  end

  it 'allows a plane to depart if conditions are all clear' do
    subject.land_plane(plane)
    allow(weather_report).to receive(:weather_conditions) { "clear"}
    expect(subject.safe_conditions?(weather_report.weather_conditions)).to eq("clear")
    allow(subject).to receive(:gets).and_return("yes")
    expect(subject.clear?).to be(true)
    expect(subject.plane_depart).to be(true)
  end

  it 'prevents a plane from landing if weather is stormy' do
    allow(weather_report).to receive(:weather_conditions) { "stormy" }
    expect(subject.safe_conditions?(weather_report.weather_conditions)).to eq("stormy")
    allow(subject).to receive(:gets).and_return("yes")
    expect(subject.clear?).to be(true)
    expect {subject.land_plane(plane)}.to raise_error 'Unable to land due to stormy conditions'
  end

  it 'prevents a plane from departing if weather is stormy' do
    subject.land_plane(plane)
    allow(weather_report).to receive(:weather_conditions) { "stormy" }
    expect(subject.safe_conditions?(weather_report.weather_conditions)).to eq("stormy")
    allow(subject).to receive(:gets).and_return("yes")
    expect(subject.clear?).to be(true)
    expect {subject.plane_depart}.to raise_error 'Unable to depart due to stormy conditions'
  end

  it 'prevents a plane from landing if airway is not clear' do
    allow(weather_report).to receive(:weather_conditions) { "clear"}
    expect(subject.safe_conditions?(weather_report.weather_conditions)).to eq("clear")
    allow(subject).to receive(:gets).and_return("no")
    expect(subject.clear?).to be(false)
    expect {subject.land_plane(plane)}.to raise_error 'Airway not clear for landing'
  end

  it 'prevents a plane from departing if airway is not clear' do
    subject.land_plane(plane)
    allow(weather_report).to receive(:weather_conditions) { "clear"}
    expect(subject.safe_conditions?(weather_report.weather_conditions)).to eq("clear")
    allow(subject).to receive(:gets).and_return("no")
    expect(subject.clear?).to be(false)
    expect {subject.plane_depart}.to raise_error "Airway not clear for departure"
  end

  it 'prevents planes from landing if airport full' do
    subject.land_plane(plane)
    expects {subject.land_plane(plane)}.to raise_error 'Airport full, piss off!'
  end

  #it "permits plane to land if airway is clear" do
    #allow(subject).to receive(:gets).and_return("yes")
    #expect(subject.clear?).to be(true)
    #expect(subject.land_plane(plane)).to be(true)
  #end

  #it "prevents plane from landing if airway is not clear" do
    #allow(subject).to receive(:gets).and_return("no")
    #expect(subject.clear?).to be(false)
    #expect {subject.land_plane(plane)}.to raise_error 'Airway not clear for landing'
  #end

  #it "prevents planes from landing if weather is stormy" do
    #allow(weather_report).to receive(:weather_conditions) { "stormy" }
    #expect(subject.safe_conditions?(weather_report.weather_conditions)).to eq("stormy")
    #expect {subject.land_plane(plane)}.to raise_error 'Unable to land due to stormy conditions'
  #end

  #it "gets a confirmation from the plane when landed" do
    #allow(weather_report).to receive(:weather_conditions) { "clear"}
    #expect(subject.safe_conditions?(weather_report.weather_conditions)).to eq("clear")
    #expect(subject.land_plane(plane)).to be(true)
  #end

  #it "permits plane to depart if airway is clear" do
    #allow(subject).to receive(:gets).and_return("yes")
    #expect(subject.clear?).to be(true)
    #subject.land_plane(plane)
    #expect(subject.plane_depart).to be(true)
  #end

  #it "prevents plane from landing if airway is not clear" do
    #subject.land_plane(plane)
    #allow(subject).to receive(:gets).and_return("no")
    #expect(subject.clear?).to be(false)
    #expect {subject.plane_depart}.to raise_error "Airway not clear for departure"
  #end

  #it "prevents planes from departing if weather is stormy" do
    #allow(weather_report).to receive(:weather_conditions) { "stormy" }
    #expect(subject.safe_conditions?(weather_report.weather_conditions)).to eq("stormy")
    #expect {subject.plane_depart}.to raise_error 'Unable to depart due to stormy conditions'
  #end

  #it "gets a confirmation from the plane when departed" do
    #allow(weather_report).to receive(:weather_conditions) { "clear"}
    #expect(subject.safe_conditions?(weather_report.weather_conditions)).to eq("clear")
    #subject.land_plane(plane)
    #expect(subject.plane_depart).to be(true)
  #end




#it "ensures the plane lands in clear weather" do
#allow(weather_report).to receive(:weather_conditions) { "clear" }
#expect(subject.landed?).to be(true)
#end

end
