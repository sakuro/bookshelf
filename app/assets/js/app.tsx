import "../css/app.css";
import { render } from "solid-js/web";
import Root from "./Root";

document.addEventListener("DOMContentLoaded", () => {
  render(() => <Root/>, document.getElementById("root"));
});
