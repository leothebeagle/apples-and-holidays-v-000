require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter].each do |holiday, supply_array|
    supply_array << supply
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day] << supply
  holiday_hash
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, season_holiday_hash|
    capitalized_season = season.to_s.capitalize!
    puts "#{capitalized_season}:"

    season_holiday_hash.each do |holiday_name, supplies|
      holiday_name_string = holiday_name.to_s
      holiday_name_array = holiday_name_string.split('_')
      holiday_name_array.collect do |word|
        word.capitalize!
      end
      capitalized_holiday_name = holiday_name_array.join(' ')

      supplies_string = supplies.join(', ')

      puts "  #{capitalized_holiday_name}: #{supplies_string}"

    end
  end

  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
end

  def all_holidays_with_bbq(holiday_hash)
    answer_array = []
    holiday_hash.each do |season, season_holiday_hash|
      season_holiday_hash.each do |holiday_name, supplies|
        if supplies.include?("BBQ")
          answer_array << holiday_name
        end
      end
    end
    answer_array
    # return an array of holiday names (as symbols) where supply lists
    # include the string "BBQ"

  end

# given that holiday_hash looks like this:
# {
#   :winter => {
#     :christmas => ["Lights", "Wreath"],
#     :new_years => ["Party Hats"]
#   },
#   :summer => {
#     :fourth_of_july => ["Fireworks", "BBQ"]
#   },
#   :fall => {
#     :thanksgiving => ["Turkey"]
#   },
#   :spring => {
#     :memorial_day => ["BBQ"]
#   }
# }
# return the second element in the 4th of July array
