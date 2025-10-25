document.addEventListener("DOMContentLoaded", () => {
  // Анимация появления элементов
  const elements = document.querySelectorAll(".info-block, .fade-in, .contact-item");
  const observer = new IntersectionObserver((entries, observer) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        const element = entry.target;
        const delay = element.dataset.delay || 0;
        setTimeout(() => {
          element.classList.add("visible");
        }, delay);
        observer.unobserve(element);
      }
    });
  }, { threshold: 0.1 });

  elements.forEach((el, index) => {
    el.dataset.delay = index * 10;
    observer.observe(el);
  });

  // --- Отправка формы через EmailJS ---
  // Подключи EmailJS в <head>:
  // <script src="https://cdn.jsdelivr.net/npm/emailjs-com@3/dist/email.min.js"></script>
  // <script>emailjs.init("YOUR_PUBLIC_KEY");</script>
  const contactForm = document.getElementById("contactForm");
  const formMessage = document.getElementById("formMessage");

  contactForm.addEventListener("submit", function(e) {
    e.preventDefault();

    // Данные формы
    const formData = {
      from_name: this.name.value,
      from_email: this.email.value,
      message: this.message.value
    };

    // Отправка через EmailJS
    emailjs.send("YOUR_SERVICE_ID", "YOUR_TEMPLATE_ID", formData)
      .then((response) => {
        console.log("SUCCESS!", response.status, response.text);
        formMessage.style.display = "block";
        contactForm.reset();
      }, (error) => {
        console.error("FAILED...", error);
        alert("Ошибка отправки. Попробуйте позже.");
      });
  });
});
