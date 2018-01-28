const request = window.superagent;

function onSuccess(response) {
	const user = response.body;

	return user;
}

function onFailure(error) {
}

function fetchUser(id) {
  return request
  	.get("http://localhost:3000/users/" + id)
  	.then(onSuccess)
  	.catch(onFailure);
}

function fetchPosts(userId) {
	return request
		.get("http://localhost:3000/users/" + userId + "/posts")
		.then((response) => response.body);
}
