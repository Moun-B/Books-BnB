import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tabdashboard"
export default class extends Controller {
  static targets = [ "tab", "cards" ]

  toggle() {
    this.tabTargets.forEach((t) => {t.classList.remove("active")});
    event.currentTarget.classList.add("active");
    this.cardsTarget.innerHTML = `<div class="book-grid" data-tabdashboard-target='cards'>
    <% @offers.each do |offer| %>
    <div class="book book-dashboard d-flex flex-column">
      <div class="cover">
        <%= image_tag offer.book.cover_url, alt: "#{offer.book.title} cover" %>
      </div>
      <div class="description">
        <p class="title"><%= offer.book.title %><br>
          <span class="author"><%= offer.book.author %></span><br>
      </div>
    </div>
  <% end %>
  </div>`
  }

}
