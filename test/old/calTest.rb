require 'test/unit'
require 'cal_dev'

class CalDev < Test::Unit::TestCase

  def test_00_match_headers
    header_variable = `cal 9 2012`
    assert_equal (header_variable..split( /\r?\n/ )[0], "   September 2012" )
  end
end

