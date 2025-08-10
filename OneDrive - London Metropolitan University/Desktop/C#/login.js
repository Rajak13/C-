document.addEventListener('DOMContentLoaded', () => {
    const body = document.querySelector("body");
    const modal = document.querySelector(".modal");
    const modalButton = document.querySelector(".modal-button");
    const closeButton = document.querySelector(".close-button");
    const scrollDown = document.querySelector(".scroll-down");
    const form = document.getElementById("loginForm");
    let isOpened = false;

    // Modal Functions
    const openModal = () => {
        modal.classList.add("is-open");
        body.style.overflow = "hidden";
        if(window.innerWidth > 768) createFloatingBooks();
    };

    const closeModal = () => {
        modal.classList.add("closing");
        setTimeout(() => {
            modal.classList.remove("is-open", "closing");
            body.style.overflow = "initial";
        }, 600);
    };

    // Form Validation
    form.addEventListener("submit", async (e) => {
        e.preventDefault();
        const email = document.getElementById("email").value;
        const password = document.getElementById("password").value;
        const errorContainer = document.querySelector(".error-message") || createErrorElement();

        if (!validateEmail(email)) {
            showError("Please enter a valid library card email");
            return;
        }

        if (password.length < 8) {
            showError("Password must be at least 8 characters");
            return;
        }

        try {
            await simulateLogin();
            window.location.href = "/dashboard";
        } catch {
            showError("Invalid credentials - please try again");
        }
    });

    // Helper Functions
    function validateEmail(email) {
        const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return re.test(String(email).toLowerCase());
    }

    function createErrorElement() {
        const errorDiv = document.createElement("div");
        errorDiv.className = "error-message";
        form.prepend(errorDiv);
        return errorDiv;
    }

    function showError(message) {
        const errorDiv = document.querySelector(".error-message");
        errorDiv.textContent = message;
        errorDiv.style.display = "block";
        setTimeout(() => errorDiv.style.opacity = "1", 10);
    }

    function simulateLogin() {
        return new Promise((resolve, reject) => {
            setTimeout(() => {
                // Replace with actual API call
                Math.random() > 0.2 ? resolve() : reject();
            }, 1000);
        });
    }

    // Book Particle Effect
    function createFloatingBooks() {
        const particles = [];
        for(let i = 0; i < 7; i++) {
            const particle = document.createElement("div");
            particle.className = "book-particle";
            particle.innerHTML = `
                <svg viewBox="0 0 24 24" width="24" height="24">
                    <path d="M18 2h-6v7L9.5 7.5 7 9V2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2z"/>
                </svg>
            `;
            particle.style.left = `${Math.random() * 100}%`;
            particle.style.animationDelay = `${i * 0.2}s`;
            document.body.appendChild(particle);
            setTimeout(() => particle.remove(), 2000);
        }
    }

    // Event Listeners
    window.addEventListener("scroll", () => {
        if (window.scrollY > window.innerHeight / 4 && !isOpened) {
            isOpened = true;
            scrollDown.style.opacity = "0";
            setTimeout(() => {
                scrollDown.style.display = "none";
                openModal();
            }, 500);
        }
    });

    modalButton.addEventListener("click", openModal);
    closeButton.addEventListener("click", closeModal);
    document.addEventListener("keydown", (e) => e.key === "Escape" && closeModal());

    // Theme Toggle
    const themeToggle = document.createElement("button");
    themeToggle.className = "theme-toggle";
    themeToggle.textContent = "📖";
    document.body.appendChild(themeToggle);

    themeToggle.addEventListener("click", () => {
        body.classList.toggle("dark-theme");
        localStorage.setItem("theme", body.classList.contains("dark-theme") ? "dark" : "light");
    });

    // Initialize Theme
    const savedTheme = localStorage.getItem("theme");
    if(savedTheme === "dark") body.classList.add("dark-theme");
});