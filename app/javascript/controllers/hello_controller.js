import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  connect() {
    flatpickr(this.inputDateTarget, {
      locale: 'ja',
      dateFormat: 'Y/m/d(D)',
    });
  }
}
