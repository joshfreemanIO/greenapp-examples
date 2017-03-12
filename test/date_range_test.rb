require 'test_helper'
require 'date_range'

class DateRangeTest < Minitest::Test
  def test_presence
    refute_nil(DateRange)
  end

  def test_instantiate_with_dates
    subject = DateRange.new(Date.new(2016,01,01), Date.new(2017,01,01))

    assert_equal(Date.new(2016,01,01), subject.start_date)
    assert_equal(Date.new(2017,01,01), subject.end_date)
  end

  def test_validation
    assert_raises DateRange::NotADateError do
      DateRange.new('Date.new(2016,01,01)', Date.new(2017,01,01))
    end

    assert_raises DateRange::NotADateError do
      DateRange.new(Date.new(2016,01,01), 'Date.new(2017,01,01)')
    end

    assert_raises DateRange::InvalidRangeError do
      DateRange.new(Date.new(2017,01,01), Date.new(2016,01,01))
    end

    assert_raises DateRange::InvalidRangeError do
      DateRange.new(Date.new(2016,01,01), Date.new(2016,01,01))
    end
  end

  def test_in_range_succeeds
    subject = DateRange.new(Date.new(2016,01,01), Date.new(2017,01,01))

    result = subject.in_range?(Date.new(2016,06,01))

    assert_equal(true, result)
  end

  def test_in_range_fails
    subject = DateRange.new(Date.new(2016,01,01), Date.new(2017,01,01))

    result = subject.in_range?(Date.new(2015,01,01))

    assert_equal(false, result)
  end
end
