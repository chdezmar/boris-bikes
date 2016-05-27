require_relative "DockingStation"


class Van

attr_reader :broken_bikes

  def initialize
    @van_storage = []
  end

  def receives_bikes(broken_bikes)
    dock
  end






end
