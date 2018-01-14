const request = window.superagent;

function fetchUser(id) {
  return request
  	.get("http://localhost:3000/users/" + id)
  	.then((response) => response.body);
}

function fetchPosts() {
	return request
		.get("http://localhost:3000/users/10/posts")
		.then((response) => response.body);
}
