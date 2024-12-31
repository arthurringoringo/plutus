document.addEventListener("DOMContentLoaded", function () {
    const closeToastButtons = document.querySelectorAll(".close-toast");

    closeToastButtons.forEach((button) => {
        button.addEventListener("click", () => {
            const toast = button.closest(".toast-notification");
            toast.remove();
        });
    });

    // Automatically remove toast after 5 seconds
    const toastContainer = document.getElementById("toast-container");
    if (toastContainer) {
        setTimeout(() => {
            const toasts = toastContainer.querySelectorAll(".toast-notification");
            toasts.forEach((toast) => {
                toast.remove();
            });
        }, 5000);
    }
});