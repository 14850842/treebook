require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test " a user should enter a first name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end
  
  test " a user should enter a last name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

  test "a user should enter a profile name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test " a user should have a unique profile name" do
  	user = User.new
  	user.profile_name = users(:sergio).profile_name
  	assert !user.save
  	puts user.errors.inspect
  	assert !user.errors[:profile_name].empty?
  end

    test " a user should have a profile without spaces" do
  	user = User.new(first_name:'Sergio',last_name:'Pellegrini',email: 'sergio1@plusplusminus.co.za')
    user.password = user.password_confirmation = "T1herew12"
  	user.profile_name = users(:sergio).profile_name
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  	assert user.errors[:profile_name].include?("Must be formatted")
  end

  test " a user should have a correctly formatted profile name" do
    user = User.new(first_name:'Sergio',last_name:'Pellegrini',email: 'sergio@plusplusminus.co.za')
    user.password = user.password_confirmation = "T1herew12"

    user.profile_name ="sergio_1"
    assert user.valid?
  end


end
