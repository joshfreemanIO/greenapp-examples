require 'date'

class DateRange
  attr_reader :start_date, :end_date

  class NotADateError < ArgumentError; end
  class InvalidRangeError < ArgumentError; end

  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date = end_date

    raise NotADateError unless start_date.is_a?(Date)
    raise NotADateError unless end_date.is_a?(Date)
    raise InvalidRangeError unless start_date < end_date
  end

  def in_range?(date)
    start_date < date && date < end_date
  end
end
