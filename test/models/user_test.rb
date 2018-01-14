require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test 'should have a first_name method' do
		u = User.new({ first_name: "Uri" })

		assert_equal(u.first_name, "Uri")
	end

	test 'should have a last_name method' do
		u = User.new({ first_name: "Uri", last_name: "Klar" })

		assert_equal(u.last_name, "Klar")
	end

	test 'full_name should return first name and last name with a space between them' do
		u = User.new({ first_name: "Uri", last_name: "Klar" })

		assert_equal("Uri Klar", u.full_name)
	end

	test 'full_name should return first name if user has no last name' do
		u = User.new({ first_name: "Uri"})

		assert_equal("Uri", u.full_name)
	end

	test 'full_name should return last name if user has no first name' do
		u = User.new({ last_name: "Klar"})

		assert_equal("Klar", u.full_name)
	end

	test 'user should have an email method' do
		u = User.new({ email: "uriklar@gmail.com" })

		assert_equal("uriklar@gmail.com", u.email)
	end

	test 'has_valid_email  should return true if email is valid' do
		u = User.new({ email: "uriklar@gmail.com" })

		assert_equal(true, u.has_valid_email)
	end

	test 'has_valid_email should return false if email is empty' do
		u = User.new

		assert_equal(false, u.has_valid_email)
	end

	test 'has_valid_email should return false if email has no @' do
		u = User.new({ email: "uriklargmail.com" })

		assert_equal(false, u.has_valid_email)
	end

	test 'has_valid_email  should return false if email has no .' do
		u = User.new({ email: "uriklar@gmailcom" })

		assert_equal(false, u.has_valid_email)
	end

	test 'generate_password should generate a random password if no password given' do
		u1 = User.new
		u2 = User.new

		pass1 = u1.generate_password
		pass2 = u2.generate_password
		assert_not_equal(pass1, pass2)
	end

	test "letter_histogram should return hash with letter as key and letter count as value" do
		u = User.new({ first_name: "Frank", last_name: "Zappa" })

		lh = u.letter_histogram || {}

		assert_equal(3, lh["a"])
		assert_equal(2, lh["p"])
		assert_equal(1, lh["f"])
	end
end
