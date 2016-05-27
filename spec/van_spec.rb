
require 'van'


describe Van do

  it "receives bikes" do
    expect(subject).to respond_to(:receives_bikes).with(1).argument
  end

  it "receives broken bikes from DockingStation" do
    expect(subject.receives_bikes(broken_bikes)).to eq bikes.release_bike
  end

end
