require_relative 'bike'

class DockingStation

	DEFAULT_CAPACITY = 20

	attr_accessor :capacity

	def initialize (capacity = DEFAULT_CAPACITY)
		@bikes = []
		@capacity = capacity
	end

	def release_bike
		fail "There are no bikes" if empty?
		fail "The bike is broken" if bikes.last.broken?
		bikes.pop
	end

	def dock (bike)
		fail "This station is full" if full?
		bikes << bike
	end

 private

attr_reader :bikes

	def full?
		bikes.length >= @capacity
	end

	def empty?
		bikes.length == 0
	end


end
