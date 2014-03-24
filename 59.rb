# Your task has been made easy, as the encryption key consists of three lower case characters.
# Using cipher1.txt, a file containing the encrypted ASCII codes, and the knowledge that the
# plain text must contain common English words, decrypt the message and find the sum of the
# ASCII values in the original text.
#
# My Notes:
# - The approach is to XOR the encrypted message with all possible 3-letter keys,
#   searching for a decrypted message containing only English words. We make use of
#   Ruby's XOR operator (^) on Fixnums
# - We find messages by filtering out decrypted messages containing characters with
#   ASCII values above 122 to find the correct key (must look in console for 
#   English passage)
# - I could have more dynamically and robustly filtered non-english messages using
#   regular expressions or a library to find the key, but I was too lazy

encrypted = File.read('./files/cipher1.txt').split(',').map(&:to_i)
message_size = encrypted.size
original = Array.new(message_size)

# use this code to find the encryption key in console
for a in (97..122)
  for b in (97..122)
    for c in (97..122)
      ords = a, b, c
      encrypted.each_with_index do |e, i|
        original[i] = e ^ ords[i % 3]
        break if original[i] > 122 # eliminates most non-english messages

        if i == message_size - 1
          puts "Key: #{a.chr + b.chr + c.chr}"
          puts original.map(&:chr).join
        end
      end
    end
  end
end

# this code decrypts the message given the key
puts
ords = ['g'.ord, 'o'.ord, 'd'.ord]
p encrypted.each_with_index.map{|e, i| e ^ ords[i % 3]}.reduce(:+)



