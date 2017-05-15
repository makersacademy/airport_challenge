require_relative '../lib/plane'

describe Plane do

  it 'can land at airports' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'can take off from airports' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it 'will not land at airports if it is already landed, even if the airport attempts to gives it clearance' do
    airport = double(:airport, planes_currently_landed: [subject])
    subject.instance_variable_set('@status', :landed)
    subject.instance_variable_set('@cleared', true)
    expect { subject.land(airport) }.to raise_error(PlaneStatusError)
  end

  it 'will not take off from airports if it is already flying, even if the airport attempts to gives it clearance' do
    subject.instance_variable_set('@cleared', true)
    expect { subject.take_off(double(:airport)) }.to raise_error(PlaneStatusError)
  end

  it 'will not land at airports if it has not received clearance to do so' do
    expect { subject.land(double(:airport)) }.to raise_error(NoClearanceError)
  end

  it 'will not takeoff from airports if it has not received clearance to do so' do
    airport = double(:airport, planes_currently_landed: [subject])
    subject.instance_variable_set('@status', :landed)
    expect { subject.take_off(airport) }.to raise_error(NoClearanceError)
  end

  describe '#land' do

    it "will toggle the plane's @status from :airborne to :landed" do
      airport = double(:airport, planes_currently_landed: [])
      subject.instance_variable_set('@cleared', true)
      subject.land(airport)
      expect(subject.status).to eq :landed
    end

    it "will reset the plane's clearance after a successful landing at airport" do
      airport = double(:airport, planes_currently_landed: [])
      subject.instance_variable_set('@cleared', true)
      subject.land(airport)
      expect(subject.instance_variable_get('@cleared')).to eq false
    end

  end

  describe '#take_off' do

    it "will toggle the plane's @status from :landed to :airborne" do
      airport = double(:airport, planes_currently_landed: [subject])
      subject.instance_variable_set('@status', :landed)
      subject.instance_variable_set('@cleared', true)
      subject.take_off(airport)
      expect(subject.status).to eq :airborne
    end

    it "will reset the plane's clearance after a successful takeoff from airport" do
      airport = double(:airport, planes_currently_landed: [subject])
      subject.instance_variable_set('@status', :landed)
      subject.instance_variable_set('@cleared', true)
      subject.take_off(airport)
      expect(subject.instance_variable_get('@cleared')).to eq false
    end

  end

end
