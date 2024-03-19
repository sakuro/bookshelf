import "../css/app.css";
import { render } from "solid-js/web";
import Root from "./Root";

document.addEventListener("DOMContentLoaded", () => {
  //render(() => <Root/>, document.getElementById("root"));

  (document.querySelectorAll(".notification .delete") || []).forEach((del: HTMLElement) => {
    const notification = del.parentNode;
    del.addEventListener("click", () => {
      notification.parentNode.removeChild(notification);
    })
  });
});
