require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20;

  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = [];
    @capacity = capacity;
  end

  def release_bike
    fail "Sorry, there are no bikes available for hire" if no_bikes_remaining?
    bikes.pop
  end

  def dock(bike)
    fail "Sorry, there are no free slots to dock a bike" if station_full?
    bikes.push(bike)
  end

    private

    attr_reader :bikes

    def no_bikes_remaining?
      bikes.empty?
    end

    def station_full?
      bikes.length >= capacity
    end

end
