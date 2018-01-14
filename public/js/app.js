// Function returns the user ID from the url (profile/:id)
function getUserIdFromUrl() {

}

function fillUserInfo(user) {
	// Fill in user name and about field
}

function createPosts(posts) {
	// Use a forEach loop to go over each post,
	// create the post HTML, and put the created post on the page
}


const userId = getUserIdFromUrl();

fetchUser(userId).then(fillUserInfo);
fetchPosts(userId).then(createPosts)