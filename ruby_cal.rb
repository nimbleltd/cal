class MakeCal
  attr_accessor :month
  attr_accessor :year

  def total_spaces_in_header
    total_spaces_in_header = @total_spaces_in_header = 20
  end

  def all_months
    all_months = @all_months = %w[March April May June July August September October November December January February]
  end

  def all_weekdays
    all_weekdays = @all_weekdays = %w[Su Mo Tu We Th Fr Sa]
  end

  def initialize(month, year)
     @month  = month.to_i
     @year  = year.to_i
  end

  def return_headers
    header = "#{how_many_spaces_do_I_need}#{what_month_is_it_longName} #{@year}"
  end

  def what_month_is_it_longName
    # print "@month = #{@month}."
    if @month > 2 and @month < 10
      month_long_name = all_months[(@month -3)]
    elsif @month == 1
      month_long_name = all_months[10]
    elsif @month == 2
      month_long_name = all_months[11]
    end
  end

# 20 spaces are available to center the month and year on
  def how_many_spaces_do_I_need
    total_chars_in_header = (what_month_is_it_longName.size + @year.to_s.size.to_i + 1)
    # print "\n @month = #{what_month_is_it_longName.size}, @year.to_s.size.to_i = #{@year.to_s.size.to_i}"
    # print "\n total_chars_in_header = #{total_chars_in_header}"
    spaces_before_month_name = ((20 - total_chars_in_header)/2)
    # print "\n spaces_before_month_name = #{spaces_before_month_name}."
    i = 1
    spacenum = ""
    while i <= spaces_before_month_name
      spacenum = spacenum + " "
      i += 1
    end
    return spacenum
  end

# 20 spaces are available to center the month and year on
  # def spacenum_to_center_header
  #   if @month > 2
  #     @month =
  # end

  # def year_or_year_and_month
  #   if ARGV[0] != nil and ARGV[1] == nil
  #     year = ARGV[0]
  #     # print year
  #     if year == "9"
  #       sally = "                               9"
  #       print sally
  #     end
  #   end
  # end
end