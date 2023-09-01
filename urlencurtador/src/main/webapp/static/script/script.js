document.addEventListener("DOMContentLoaded", function() {
	const copyButtons = document.querySelectorAll(".copy-button");

	copyButtons.forEach(button => {
		button.addEventListener("click", function() {
			const shortUrl = this.getAttribute("data-url");
			copyToClipboard(shortUrl);
		});
	});

	function copyToClipboard(text) {
		const textarea = document.createElement("textarea");
		textarea.value = text;
		document.body.appendChild(textarea);
		textarea.select();
		document.execCommand("copy");
		document.body.removeChild(textarea);
	}
});