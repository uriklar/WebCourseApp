// Function returns the user ID from the url (profile/:id)
function getUserIdFromUrl() {
	return window.location.pathname.split("/")[2];
}


function fillUserImage(user) {
	const url = `https://api.adorable.io/avatars/285/${user.email}.png`;
	const imageTag = document.querySelector('img.profile-pic');

	imageTag.src = url;
}

function fillUserName(user) {
	debugger;
	const nameTag = document.querySelector('.name');

	nameTag.innerHTML = `${user.first_name} ${user.last_name}`;
}

function fillUserEmail(user) {
	const emailTag = document.querySelector('.email');

	emailTag.innerHTML = user.email;
}

function fillUserInfo(user) {
	fillUserImage(user);
	fillUserName(user);
	fillUserEmail(user);
}

function createPosts(posts) {
	const postsContainer = document.querySelector(".posts");

	postsContainer.innerHTML = "";
	// Use a forEach loop to go over each post,
	// create the post HTML, and put the created post on the page
	posts.forEach((post) => {
		const postTag = document.createElement("div");

		postTag.innerHTML = post.text;
		postTag.className = "post";

		postsContainer.appendChild(postTag);
	});
}


const userId = getUserIdFromUrl();

fetchUser(userId).then(fillUserInfo);
fetchPosts(userId).then(createPosts)
