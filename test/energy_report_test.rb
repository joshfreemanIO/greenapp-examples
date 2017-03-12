require 'test_helper'
require 'energy_report'

class EnergyReportTest < Minitest::Test
  def test_presence
    refute_nil(EnergyReport)
  end

  def test_instantiates_with_a_value
    params = {
      measured_monthly_kilowatt_hours: KilowattHour.new(12.0),
      modeled_monthly_kilowatt_hours: KilowattHour.new(8.7)
    }

    subject = EnergyReport.new(params)

    assert_equal(KilowattHour.new(12.0), subject.measured_monthly_kilowatt_hours)
    assert_equal(KilowattHour.new(8.7), subject.modeled_monthly_kilowatt_hours)
  end

  def test_percentage_difference
    params = {
      measured_monthly_kilowatt_hours: KilowattHour.new(100.0),
      modeled_monthly_kilowatt_hours: KilowattHour.new(50.0)
    }

    subject = EnergyReport.new(params)

    result = subject.percentage_difference

    assert_equal(0.50, result)
  end
end
