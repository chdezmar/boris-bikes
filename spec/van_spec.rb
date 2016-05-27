
require 'van'


describe Van do

  it "takes bikes" do
    expect(subject).to respond_to(:takes).with(1).argument
  end

  it "takes the broken bikes from the dock" do
    expect(subject.takes(released_bike)).to eq DockingStation.release_bike
  end

end
