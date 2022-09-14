import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tabdashboard"
export default class extends Controller {
  static targets = [ "tabBook", "tabRental", "tabOffer", "tab"]

  toggle(event) {
    this.tabTargets.forEach((t) => {t.classList.remove("active")});
    event.currentTarget.classList.add("active");
    this.cardsTargets.forEach((t) => {t.classList.add("d-none")});
    if (event.currentTarget == this.tabOfferTarget)
      this.cardsOfferTarget.classList.remove("d-none");
    else if (event.currentTarget == this.tabRentalTarget)
      this.cardsRentalTarget.classList.remove("d-none");
    else if (event.currentTarget == this.tabBookTarget)
      this.cardsBookTarget.classList.remove("d-none");
  }

}
