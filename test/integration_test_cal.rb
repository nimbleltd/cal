require 'test/unit'
require './ruby_cal'

class MakeCalTest < Test::Unit::TestCase

  def test_00_return_the_headers_of_9_2012
    header_variable = `cal 9 2012`
    billy = header_variable.split( /\r?\n/ )[0]
    assert_equal billy,`ruby ruby_cal.rb 9 2012`
  end

  def test_01_only_one_fixnum_passed_return_error
    willy = `cal 9`
    mike = willy.split( /\r?\n/ )
    assert_equal(mike[0], `ruby ruby_cal.rb 9`)
  end

  def test_02_is_it_a_leap_year?
    assert_equal(`cal 2 1804`, `ruby ruby_cal.rb 2 1804`)
    #true this is a leap year
  end

  def test_03_output_of_February_not_a_leap_year_2014
    assert_equal(`cal 2 2014`, `ruby ruby_cal.rb 2 2014`)
  end

  def test_04_output_of_31_day_month_on_exception_year
    assert_equal(`cal 1 2100`, `ruby ruby_cal.rb 1 2100`)
  end

  def test_05_output_of_5_line_month
    assert_equal(`cal 3 2013`, `ruby ruby_cal.rb 3 2013`)
  end

  def test_06_output_of_6_line_month
    assert_equal(`cal 4 2013`, `ruby ruby_cal.rb 4 2013`)
  end
end

