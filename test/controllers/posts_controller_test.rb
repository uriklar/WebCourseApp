require 'test_helper'

class PostsControllerTest < ActionController::TestCase
	setup do
    @user = User.create({ first_name: "Donald", last_name: "Trump" })
    @user.posts.create([
    	{ text: "Wow, “FBI lawyer James Baker reassigned,” according to @FoxNews" },
    	{ text: "Nobody but Donald Trump will save Israel"}
  	])
  end

  test "index action should return all of the user's posts" do
  	get :index, user_id: @user.id

  	res = get_json @response
    assert_equal(2, res.count)
  end

	test "show action should return a specific post" do
		get :show, user_id: @user.id, id: @user.posts.first.id

  	res = get_json @response

    assert_equal(res["text"], @user.posts.first.text)
	end	

  test "create action should create a post and return it" do
    post_count_before = Post.count

    post :create, user_id: @user.id, post: { text: "Create this post!!" }
    res = get_json @response

    assert_equal(post_count_before + 1, Post.count)
  end

  test "destroy action should delete a post and return it" do
    post_count_before = Post.count

    delete :destroy, user_id: @user.id, id: @user.posts.last.id
    res = get_json @response

    assert_equal(post_count_before - 1, Post.count)
  end

  test "search action should return posts that include query" do
    get :search, params: { user_id: @user.id, query: "FBI" }

    res = get_json @response

    assert_equal(@user.posts.first.id, res[0]["id"])
  end
end
