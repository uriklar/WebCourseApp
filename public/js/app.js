function fillUserImage(user) {
	const url = `https://api.adorable.io/avatars/285/${user.email}.png`;
	const imageTag = document.querySelector('.profile-pic');

	imageTag.src = url;
}

function fillUserName(user) {
	const firstNameTag = document.querySelector('.user-details .first-name');
	const lastNameTag = document.querySelector('.user-details .last-name');

	firstNameTag.innerHTML = user.first_name;
	lastNameTag.innerHTML = user.last_name;
}

function fillUserEmail(user) {
	const emailTag = document.querySelector('.user-details .email');

	emailTag.innerHTML = user.email;
}

function fillUserInfo(user) {
	fillUserImage(user);
	fillUserName(user);
	fillUserEmail(user);
}

function reverseName() {
	const firstNameTag = document.querySelector('.user-details .first-name');
	const lastNameTag = document.querySelector('.user-details .last-name');

	const firstName = firstNameTag.innerHTML;
	const lastName = lastNameTag.innerHTML;

	firstNameTag.innerHTML = lastName;
	lastNameTag.innerHTML = firstName;
}

function getUserId() {
	return window.location.search.split("user_id=")[1];
}

function init() {
	const userId = getUserId();
	fetchUser(userId).then(fillUserInfo);

	const button = document.querySelector('#reverse_button');

	button.addEventListener('click', reverseName)
}

init();