import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="total-price"
export default class extends Controller {
  static targets = ["days", "start", "end"]

  connect() {
    // console.log("Hello from total_price_controller!", this.element)
  }

  calculateDays() {
    // console.log((this.startTarget.value))

    let start = this.startTarget.value;
    let end = this.endTarget.value;

    start = this.formatDate(start);
    end = this.formatDate(end);


    start = new Date(start);
    end = new Date(end);

    daysDiff = this.getDifferenceInDays(end - start);

    // console.log(start)
    // console.log(end)
    console.log(daysDiff)

    // console.log(this.endTarget.value)
    // this.daysTarget.innerText = this.endTarget.value - this.startTarget.value;
  }

  formatDate(date) {
    var d = new Date(date),
      month = '' + (d.getMonth() + 1),
      day = '' + d.getDate(),
      year = d.getFullYear();

    if (month.length < 2)
      month = '0' + month;
    if (day.length < 2)
      day = '0' + day;

    return [year, month, day].join('-');
  }

  getDifferenceInDays(date1, date2) {
    const diffInMs = Math.abs(date2 - date1);
    return diffInMs / (1000 * 60 * 60 * 24);
  }

}
