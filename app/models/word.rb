class Word
	def self.find_anagrams(string)
		# convert word to an array of letters
		letters = string.split(//)
		# create an array to store our find_anagrams
		anagrams = []
		# loop through each letter in letters
		letters.each do |letter|
			# select the remaining letters
			remaining = letters.select { |l| l != letter }
			# create a new word by combining the letter + remaining letters
			# add new word to anagrams array
			anagrams << letter + remaining.join('')
			# create a new word by combining the letter + the reverse of the remaining letters
			# add new word to anagrams array
			anagrams << letter + reverse_letters(remaining).join('')
		end	
		# return anagrams array
		anagrams
	end

	def self.reverse_letters(letters)
		# create a new array of 2 items
		length = letters.length
		reversed_letters = Array.new(length)

		# loop through letters and keep index
		letters.each_with_index do |letter, index|
			reversed_letters[length - index - 1] = letter
		end
		reversed_letters
	end
end
