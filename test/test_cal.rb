require 'test/unit'
require './ruby_cal'

class MakeCalTest < Test::Unit::TestCase

  def test_00a_return_the_headers_of_9_2012
    header_variable = MakeCal.new(3, 2012)
    header_from_MakeCal = header_variable.return_headers
    argRequest = `cal 3 2012`
    header_from_cal = argRequest.split( /\r?\n/ )[0]
    assert_equal header_from_cal, header_from_MakeCal
  end

  def test_00b_return_the_headers_of_9_2012
    header_variable = MakeCal.new(1, 2012)
    header_from_MakeCal = header_variable.return_headers
    argRequest = `cal 1 2012`
    header_from_cal = argRequest.split( /\r?\n/ )[0]
    assert_equal header_from_cal, header_from_MakeCal
  end

  def test_00_return_the_headers_of_9_2012
    header_variable = MakeCal.new(9, 2012)
    header_from_MakeCal = header_variable.return_headers
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

  def test_05_how_many_spaces_are_needed_before_the_month_in_the_header

  end

  # def test_01_only_one_fixnum_passed_return_error
  #   willy = `cal 9`
  #   mike = willy.split( /\r?\n/ )
  #   assert_equal(mike[0], `ruby ruby_cal.rb 9`)
  # end

end

