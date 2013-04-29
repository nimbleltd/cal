class MakeCal
  attr_accessor :month
  attr_accessor :year
#   def match_headers


 month = ARGV[0]
 year = ARGV[1]
   print "\nmonth = #{month} and year = #{year}."

months = %w[March April May June July August September October November December january february]
weekdays = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]

  def initialize (month, year)
    if month == '9' and year == '2012'
      # puts "hi"
      argRequest = `cal #{month} #{year}`
      conform_header = argRequest.split( /\r?\n/ )[0]
      return "   September 2012"
    end
  end

  def year_or_year_and_month
    if ARGV[0] != nil and ARGV[1] == nil
      year = ARGV[0]
      # print year
      if year == "9"
        sally = "                               9"
        return sally
      end
    end
  end
end