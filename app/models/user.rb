class User < ActiveRecord::Base
	has_many :posts

	# # validates :first_name, presence: true
	# # validate :has_valid_email

	# def full_name
	# 	if first_name && last_name
	# 		return "#{first_name} #{last_name}"
	# 	end

	# 	"#{first_name}#{last_name}"
	# end

	# def has_valid_email
	# 	if email && email.include?("@") && email.include?(".")
	# 		true
	# 	else
	# 		errors.add(:email, "email must have @ and .")
	# 	end
	# end

	# def generate_password
	# 	SecureRandom.hex
	# end

	# def letter_histogram
	# 	result = {}

	# 	(first_name + last_name).downcase.split("").each do |letter|
	# 		result[letter] = (result[letter] || 0) + 1
	# 	end

	# 	result
	# end
end
