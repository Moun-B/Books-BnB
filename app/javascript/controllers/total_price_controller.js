import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="total-price"
export default class extends Controller {
  static targets = ["days", "start", "end", "price", "total", "priceInTotal", "x"]

  connect() {
    // console.log("Hello from total_price_controller!", this.element)
  }

  calculateDays() {
    // console.log((this.startTarget.value))

    let start = Date.parse(this.startTarget.value);
    let end = Date.parse(this.endTarget.value);
    const price = this.priceTarget.innerText;

    if (start && end) {
      const daysDiff = this.getDifferenceInDays(end, start);
      this.daysTarget.innerText = daysDiff;
      if (price && daysDiff) {
        this.xTarget.innerHTML = " x ";
      }
      const total = price * daysDiff;
      this.priceInTotalTarget.innerHTML = `¥${price}`;
      this.totalTarget.innerHTML = `¥${total}`;
    }
  }

  getDifferenceInDays(date1, date2) {
    const diffInMs = Math.abs(date2 - date1);
    return diffInMs / (1000 * 60 * 60 * 24);
  }

}
