class Word < ActiveRecord::Base
	
	before_create :add_letters

	def add_letters
		characters = self.text.chars
  		alphabetized_characters = characters.sort
  		self.letters = alphabetized_characters.join
	end

	def self.find_anagrams(string)
		# convert word to an array of letters
		letters = letters.split(//)
		# create an array to store our find_anagrams
		anagrams = []
		# loop through each letter in letters
		letters.each do |letter|
			# select the remaining letters
			remaining = letters.select { |l| l != letter }
			# create a new word by combining the letter + remaining letters
			# add new word to anagrams array
			potential_anagram = letter + remaining.join('')
			if !Word.find_by_text(potential_anagram).nil?
				anagrams << potential_anagram
			end
			# create a new word by combining the letter + the reverse of the remaining letters
			# add new word to anagrams array
			potential_anagram = letter + reverse_letters(remaining).join('')
			if !Word.find_by_text(potential_anagram).nil?
				anagrams << potential_anagram
			end
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

	def self.three_letters?(input)
 		if input.length <= 3
 			true
 		else
 			false
 		end
 	end

 	def self.distinct_letters?(input)
 		letter_array = input.chars
 		unique_letters = letter_array.uniq
 		if unique_letters.length < letter_array.length
 			false
 		else
 			true
 		end
 	end

 	def self.valid_input?(input)
 		if input.length > 3
 			raise Exception.new("Word must be less than or equal to 3 characters.")
 		end	
 	end
end
