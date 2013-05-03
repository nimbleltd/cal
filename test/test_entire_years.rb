require 'test/unit'
require './ruby_cal'

class MakeAnualCalTest < Test::Unit::TestCase

  def test_01_header_check
    argRequest = `cal 1804`
    week00_cal = argRequest.split( /\r?\n/ )[0]
    week01_cal = argRequest.split( /\r?\n/ )[1]
    week02_cal = argRequest.split( /\r?\n/ )[2]
    week03_cal = argRequest.split( /\r?\n/ )[3]
    week04_cal = argRequest.split( /\r?\n/ )[4]
    week05_cal = argRequest.split( /\r?\n/ )[5]
    week06_cal = argRequest.split( /\r?\n/ )[6]
    week07_cal = argRequest.split( /\r?\n/ )[7]
    week08_cal = argRequest.split( /\r?\n/ )[8]
    week09_cal = argRequest.split( /\r?\n/ )[9]
    week10_cal = argRequest.split( /\r?\n/ )[10]
    week11_cal = argRequest.split( /\r?\n/ )[11]
    week12_cal = argRequest.split( /\r?\n/ )[12]
    week13_cal = argRequest.split( /\r?\n/ )[13]
    week14_cal = argRequest.split( /\r?\n/ )[14]
    week15_cal = argRequest.split( /\r?\n/ )[15]
    week16_cal = argRequest.split( /\r?\n/ )[16]
    week17_cal = argRequest.split( /\r?\n/ )[17]
    week18_cal = argRequest.split( /\r?\n/ )[18]
    week19_cal = argRequest.split( /\r?\n/ )[19]
    week20_cal = argRequest.split( /\r?\n/ )[20]
    week21_cal = argRequest.split( /\r?\n/ )[21]
    week22_cal = argRequest.split( /\r?\n/ )[22]
    week23_cal = argRequest.split( /\r?\n/ )[23]
    week24_cal = argRequest.split( /\r?\n/ )[24]

    willy = MakeCal.new(9, 1804)
    sally00 = willy.deliver_whole_year.split( /\r?\n/ )[0]
    sally01 = willy.deliver_whole_year.split( /\r?\n/ )[1]
    sally02 = willy.deliver_whole_year.split( /\r?\n/ )[2]
    sally03 = willy.deliver_whole_year.split( /\r?\n/ )[3]
    sally04 = willy.deliver_whole_year.split( /\r?\n/ )[4]
    sally05 = willy.deliver_whole_year.split( /\r?\n/ )[5]
    sally06 = willy.deliver_whole_year.split( /\r?\n/ )[6]
    sally07 = willy.deliver_whole_year.split( /\r?\n/ )[7]
    sally08 = willy.deliver_whole_year.split( /\r?\n/ )[8]
    sally09 = willy.deliver_whole_year.split( /\r?\n/ )[9]
    sally10 = willy.deliver_whole_year.split( /\r?\n/ )[10]
    sally11 = willy.deliver_whole_year.split( /\r?\n/ )[11]
    sally12 = willy.deliver_whole_year.split( /\r?\n/ )[12]
    sally13 = willy.deliver_whole_year.split( /\r?\n/ )[13]
    sally14 = willy.deliver_whole_year.split( /\r?\n/ )[14]
    sally15 = willy.deliver_whole_year.split( /\r?\n/ )[15]
    sally16 = willy.deliver_whole_year.split( /\r?\n/ )[16]
    sally17 = willy.deliver_whole_year.split( /\r?\n/ )[17]
    sally18 = willy.deliver_whole_year.split( /\r?\n/ )[18]
    sally19 = willy.deliver_whole_year.split( /\r?\n/ )[19]
    sally20 = willy.deliver_whole_year.split( /\r?\n/ )[20]
    sally21 = willy.deliver_whole_year.split( /\r?\n/ )[21]
    sally22 = willy.deliver_whole_year.split( /\r?\n/ )[22]
    sally23 = willy.deliver_whole_year.split( /\r?\n/ )[23]
    sally24 = willy.deliver_whole_year.split( /\r?\n/ )[24]


    assert_equal(week00_cal,sally00)
    assert_equal(week01_cal,sally01)
    assert_equal(week02_cal,sally02)
    assert_equal(week03_cal,sally03)
    assert_equal(week04_cal,sally04)
    assert_equal(week05_cal,sally05)
    assert_equal(week06_cal,sally06)
    assert_equal(week07_cal,sally07)
    assert_equal(week08_cal,sally08)
    assert_equal(week09_cal,sally09)
    assert_equal(week10_cal,sally10)
    assert_equal(week11_cal,sally11)
    assert_equal(week12_cal,sally12)
    assert_equal(week13_cal,sally13)
    assert_equal(week14_cal,sally14)
    assert_equal(week15_cal,sally15)
    assert_equal(week16_cal,sally16)
    assert_equal(week17_cal,sally17)
    assert_equal(week18_cal,sally18)
    assert_equal(week19_cal,sally19)
    assert_equal(week20_cal,sally20)
    assert_equal(week21_cal,sally21)
    assert_equal(week22_cal,sally22)
    assert_equal(week23_cal,sally23)
    assert_equal(week24_cal,sally24)
   	# assert_equal(`cal 1804`, `ruby cal.rb 1804`)
    #true this is a leap year
  end

  # def test_02_full_year_check
  #   # year_whole = MakeCal.new(0, )
  #   assert_equal `cal 1804`, `ruby cal.rb 1804`
  # end
end