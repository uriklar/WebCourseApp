const request = window.superagent;

function fetchUser(id) {
  return request
  	.get("http://localhost:3000/users/" + id)
  	.then((response) => response.body);
}

function fetchPosts(userId) {
	return request
		.get("http://localhost:3000/users/" + userId + "/posts")
		.then((response) => response.body);
}
