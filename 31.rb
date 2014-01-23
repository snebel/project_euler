# In England the currency is made up of pound, £, and pence, p, 
# and there are eight coins in general circulation:
# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
#
# How many different ways can £2 be made using any number of coins?
#
# My Notes:
# - Need all linear combinations of a..h such that
#   a(1) + b(2) + c(5) + d(10) + e(20) + f(50) + g(100) + h(200) = 200
# - total possibilities to check using max possible number of each coin:
#   200 * 100 * 40 * 20 * 10 * 4 * 2 * 1 = 1,280,000,000
# - My solution is almost as bad as brute force, but is optimized
#   to check possible number of coins only upto the maximum possible 
#   number of coins given a fixed number of previous coins.
# - I wanted to generalize this approach into a method taking an
#   arbitrary total and arbitrary array of denominations, but could
#   not figure out how to dynamically create nested loops in a ruby method.

count = 0
0.upto((200-0)/1) do |a| # num 1p coins
  0.upto((200-a)/2) do |b| # num 2p coins
    0.upto((200-b)/5) do |c| # num 5p coins
      0.upto((200-c)/10) do |d| # num 10p coins
        0.upto((200-d)/20) do |e| # num 20p coins
          0.upto((200-e)/50) do |f| # num 50p coins
            0.upto((200-f)/100) do |g| # num 1£ coins
              if a*1 + b*2 + c*5 + d*10 + e*20 + f*50 + g*100 == 200
                count += 1 
                print [a, b, c, d, e, f, g]
                puts
              end
            end
          end
        end
      end
    end
  end
end
puts count + 1 # for 1 2£ coin possibility
