document.getElementById('signupForm').addEventListener('submit', function(e) {
    e.preventDefault();
    const username = document.getElementById('signupUsername').value;
    const email = document.getElementById('signupEmail').value;
    const password = document.getElementById('signupPassword').value;
    const confirmPassword = document.getElementById('confirmPassword').value;

    // Basic validation
    if (password !== confirmPassword) {
        // Optionally, you could add inline error messaging here
        return;
    }

    // Create user object
    const user = {
        username: username,
        email: email,
        password: password
    };

    // Store user in localStorage
    let users = JSON.parse(localStorage.getItem('users')) || [];
    
    // Check if user already exists
    const existingUser = users.find(u => u.username === username);
    if (existingUser) {
        // Optionally, you could add inline error messaging here
        return;
    }

    users.push(user);
    localStorage.setItem('users', JSON.stringify(users));
    
    window.location.href = 'login.html';
});