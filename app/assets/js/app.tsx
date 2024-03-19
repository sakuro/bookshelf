import "../css/app.scss";

document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll<HTMLElement>(".notification .delete").forEach((del) => {
    del.addEventListener("click", () => {
      const notification = del.parentNode;
      const section = notification.parentNode;
      section.removeChild(notification);
      const remainingNotifications = section.querySelectorAll<HTMLElement>(".notification");
      if (remainingNotifications.length == 0) {
        section.parentNode.removeChild(section);
      }
    })
  });

  const burgers = document.querySelectorAll<HTMLElement>(".navbar-burger");
  burgers.forEach((burger) => {
    burger.addEventListener("click", () => {
      const target = document.getElementById(burger.dataset.target);
      console.log({target});
      burger.classList.toggle("is-active");
      target.classList.toggle("is-active");
    });
  });
});
