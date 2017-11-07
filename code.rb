#My solution:

=begin
def stock_picker(array)
    profit = 0
    current_low_pos = 0
    low_pos = 0
    high_pos = 1
    while current_low_pos < array.length
        for value in array
            current_high_pos = current_low_pos + 1
            while current_high_pos < array.length
                if array[current_high_pos] - array[current_low_pos] > profit
                    profit = array[current_high_pos] - array[current_low_pos]
                    low_pos = current_low_pos
                    high_pos = current_high_pos
                end
                current_high_pos += 1
            end
            current_low_pos += 1
        end
    end
    puts '[Buy, Sell] at position ' + [low_pos, high_pos].to_s + " for a profit of $#{array[high_pos]} - $#{array[low_pos]} = $#{profit}"
end
=end

#My version of github user (funwithcthulhu)'s genius solution, which used far less lines to do the same job.

def stock_picker(array)
    profits = {}
    array.each_index do |low_pos|
        array.each_index do |high_pos|
            next unless high_pos > low_pos
            profits[array[high_pos] - array[low_pos]] = [low_pos, high_pos]
        end
    end
    puts '[Buy, Sell] at position ' + profits[profits.keys.max].inspect.to_s + " for a profit of $#{array[profits[profits.keys.max][1]]} - $#{array[profits[profits.keys.max][0]]} = $#{profits.keys.max}"
end

daily_prices = [70, 50, 10, 15, 40, 20]
stock_picker(daily_prices)