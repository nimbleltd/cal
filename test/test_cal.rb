require 'test/unit'
require './ruby_cal'

class MakeCalTest < Test::Unit::TestCase

  def test_00a_return_the_headers_of_9_2012
    header_variable = MakeCal.new(3, 2012)
    header_from_MakeCal = header_variable.return_header
    argRequest = `cal 3 2012`
    header_from_cal = argRequest.split( /\r?\n/ )[0]
    assert_equal header_from_cal, header_from_MakeCal
  end

  def test_00b_return_the_headers_of_9_2012
    header_variable = MakeCal.new(1, 2012)
    header_from_MakeCal = header_variable.return_header
    argRequest = `cal 1 2012`
    header_from_cal = argRequest.split( /\r?\n/ )[0]
    assert_equal header_from_cal, header_from_MakeCal
  end

  # def test00c_month_out_of_range
  #   assert_raise ArgumentError do
  #     calendar = MakeCal.new 23, 2013
  #   end
  # end

  #   def test00c_year_out_of_range
  #   assert_raise ArgumentError do
  #     calendar = MakeCal.new 10, 3030
  #   end
  # end

  def test_00_return_the_headers_of_9_2012
    header_variable = MakeCal.new(9, 2012)
    header_from_MakeCal = header_variable.return_header
    argRequest = `cal 9 2012`
    header_from_cal = argRequest.split( /\r?\n/ )[0]
    assert_equal header_from_cal, header_from_MakeCal
  end

  def test_01_what_month_is_it_longName_September
    header_variable = MakeCal.new(9, 2012)
    billy = header_variable.what_month_is_it_longName
    assert_equal "September", billy
  end

  def test_02_what_month_is_it_longName_January
    header_variable = MakeCal.new(1, 2012)
    billy = header_variable.what_month_is_it_longName
    assert_equal "January", billy
  end

  def test_03_what_month_is_it_longName_March
    header_variable = MakeCal.new(3, 2012)
    billy = header_variable.what_month_is_it_longName
    assert_equal "March", billy
  end

  def test_04_how_many_spaces_are_needed_before_the_month_in_the_header
    header_variable = MakeCal.new(9, 2012)
    billy = header_variable.how_many_spaces_do_I_need
    assert_equal "   ", billy
  end

  def test_05_display_header_and_days_of_the_week
    argRequest = `cal 9 2012`
    header_from_cal = argRequest.split( /\r?\n/ )[0]
    days_of_the_week = argRequest.split( /\r?\n/ )[1]
    # print "\ndays_of_the_week =#{days_of_the_week}"
    yo = "#{header_from_cal}\n#{days_of_the_week}\n"
    sally = MakeCal.new(9, 2012)
    phil = sally.top_two_lines
    assert_equal phil, yo
  end

  def test_06_return_day_of_the_week
    willy = MakeCal.new(1, 2012)
    sally = willy.first_day_of_the_month
    print sally
    assert_equal(sally, 0)
  end

  def test_07_return_day_of_the_week
    willy = MakeCal.new(1, 3000)
    sally = willy.first_day_of_the_month
    print sally
    assert_equal(sally, 3)
  end

  def test_08_total_days_in_the_month
    willy = MakeCal.new(2, 2037)
    sally = willy.number_of_days_in_the_month
    print sally
    assert_equal(sally, 28)
  end

  # def test_09_write_all_days_month
  #   willy = MakeCal.new(1, 2037)
  #   sally = willy.print_all_the_days_of_the_month
  #   print sally
  #   #assert_equal(sally, `cal 1 2037`)
  #   assert_equal(" 4  5  6  7  8  9 10", sally)
  # end

  def test_10_compare_whole_month
  willy = MakeCal.new(1, 2037)
  sally = willy.deliver_whole_month
  print sally
  assert_equal(`cal 1 2037`,sally)
  end

  def test_11_compare_whole_month
  willy = MakeCal.new(9, 2017)
  sally = willy.deliver_whole_month
  print sally
  assert_equal(`cal 9 2017`,sally)
  end


end

