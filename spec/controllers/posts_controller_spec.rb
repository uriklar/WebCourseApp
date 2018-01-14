require 'rails_helper'

RSpec.describe PostsController, type: :controller do
	before do
    @user = User.create({ first_name: "Donald", last_name: "Trump" })
    @user.posts.create([
    	{ text: "Wow, “FBI lawyer James Baker reassigned,” according to @FoxNews" },
    	{ text: "Nobody but Donald Trump will save Israel"}
  	])
  end

  it "index action should return all of the user's posts" do
  	get :index, user_id: @user.id

  	res = response.body
  	expect(res.count).to eq(2)
  end

	it "show action should return a specific post" do
		get :show, user_id: @user.id, post(@user, @user.posts.first)

  	res = response.body
  	expect(response[:id]).to eq(@user.posts.first.id)
    assert_equal(response[:text], @user.posts.first.text)
	end	
end
