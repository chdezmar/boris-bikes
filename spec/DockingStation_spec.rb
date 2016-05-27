#describe docking station

require 'DockingStation'

describe DockingStation do

	let(:bike) {double :bike}

	it "responds to release_bike" do
		expect(subject).to respond_to :release_bike
	end

	it "has a default capacity" do
		expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
	end

	it "allows user to set capacity" do
		subject.capacity = 30
		expect(subject.capacity).to eq 30
	end

	describe "#release_bike" do
		it "releases the working bike" do
			allow(bike).to receive(:broken?).and_return(false)
			subject.dock(bike)
			released_bike = subject.release_bike
			expect(released_bike).not_to be_broken
		end


		it "releases a bike if bike is not broken" do
			allow(bike).to receive(:broken?).and_return(true)
			subject.dock(bike)
			expect {subject.release_bike}.to raise_error("The bike is broken")
		end

		it "raises an error when there are no bikes" do
			expect {subject.release_bike}.to raise_error("There are no bikes")
		end
	end

	it "responds to dock" do
		expect(subject).to respond_to(:dock).with(1).argument
	end

	describe "#dock" do

		it "raises and error when the docking station is full" do
			subject.capacity.times {subject.dock(Bike.new)}
			expect {subject.dock(Bike.new)}.to raise_error("This station is full")
		end
	end


end
