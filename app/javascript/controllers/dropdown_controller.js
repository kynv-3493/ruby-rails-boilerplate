import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="dropdown"
export default class extends Controller {
  static targets = ["content", "button"];

  connect() {
    this.contentTarget.style.display = "none";
  }

  toggle() {
    if (this.contentTarget.style.display === "none") {
      this.contentTarget.style.display = "block";
    } else {
      this.contentTarget.style.display = "none";
    }
  }

  select(event) {
    // const selectedValue = event.currentTarget.dataset.value;
    // this.buttonTarget.innerHTML = `Selected: ${selectedValue}`;
    this.contentTarget.style.display = "none";
  }
}
