// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
// import "bootstrap"
import * as bootstrap from "bootstrap"

import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers"
import { Turbo } from "@hotwired/turbo-rails";

window.Stimulus = Application.start()
const context = require.context("./controllers", true, /\.js$/)
Stimulus.load(definitionsFromContext(context))

Turbo.setConfirmMethod((message, element) => {
  let modal = new bootstrap.Modal(document.getElementById('turbo-confirm'));
  modal.show();

  return new Promise((resolve, reject) => {
    console.log('promise');
    let confirmButton = modal._element.querySelector('button[value=confirm]');
    let cancelButton = modal._element.querySelector('button[value=cancel]');
    confirmButton.addEventListener('click', () => {
      resolve(true);
      console.log('event listener');
    })
    cancelButton.addEventListener('click', () => {
      resolve(false);
    })
    // setTimeout(() => {
    //   resolve(true)
    // }, 2000);
  })

});
