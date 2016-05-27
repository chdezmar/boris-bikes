require_relative 'bike'
require_relative 'van'

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

	def dock(bike)
		fail "This station is full" if full?
		bike.broken? ? release_broken_bikes(bike) : bikes << bike
	end

	private

	attr_reader :bikes, :van

	def full?
		bikes.length >= @capacity
	end

	def release_broken_bikes(bike)
		van.van_storage << bike
	end

	def empty?
		bikes.length == 0
	end


end
