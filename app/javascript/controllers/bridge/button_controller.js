import { BridgeComponent } from "@hotwired/hotwire-native-bridge"

// Connects to data-controller="bridge--button"
export default class extends BridgeComponent {
  // Set the component's identifier to "button".
  static component = "button"

  connect() {
    super.connect()

    const title = this.bridgeElement.bridgeAttribute("title")
    const imageName = this.bridgeElement.bridgeAttribute("image-name")
    // Below is sending title and imageName to iOS app.
    this.send("connect", {title, imageName}, () => {
      this.bridgeElement.click()
    })
  }

  disconnect() {
    super.disconnect()

    this.send("disconnect")
  }
}
