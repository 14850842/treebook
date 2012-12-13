require 'test_helper'

class StatusTest < ActiveSupport::TestCase
	test "that status requires content" do
	  status = Status.new
	  assert !status.save
	  assert !status.errors[:content].empty?
	end

	test "that status requires content" do
	  status = Status.new
	  status.content = "H"
	  assert !status.save
	  assert !status.errors[:content].empty?
	end

	test "that status requires content" do
	  status = Status.new
	  status.content = "Hello"
	  assert !status.save
	  assert !status.errors[:content].empty?
	end
end
