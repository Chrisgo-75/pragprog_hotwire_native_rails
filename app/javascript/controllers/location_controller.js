/***
 * Excerpted from "Hotwire Native for Rails Developers",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material,
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose.
 * Visit https://pragprog.com/titles/jmnative for more book information.
***/
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["latitude", "longitude"]

  request(event) {
    event.preventDefault()

    navigator.geolocation.getCurrentPosition(
      this.success.bind(this),
      this.failure.bind(this),
      {enableHighAccuracy: true}
    )
  }

  success(position) {
    const {latitude, longitude} = position.coords
    this.latitudeTarget.value = latitude
    this.longitudeTarget.value = longitude
  }

  failure(error) {
    alert(`Could not get your location: ${error.message}.`)
  }
}
