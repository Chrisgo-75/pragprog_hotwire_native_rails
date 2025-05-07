import { BridgeComponent, BridgeElement } from "@hotwired/hotwire-native-bridge";

// Connects to data-controller="bridge--overflow-menu"
export default class extends BridgeComponent {
  static values = {
    enabled: { type: Boolean, default: true }
  }
  static component = "overflow-menu"
  static targets = ['item']

  connect() {
    super.connect()
    if (this.enabledValue) {
      this.setUpMenu()
    }
  } // END connect()

  disconnect() {
    super.disconnect()
    this.send("disconnect")
  }

  setUpMenu() {
    const label = this.bridgeElement.title
    const items = this.buildMenuItems(this.itemTargets)
    this.send("connect", { label, items }, message => {
      const selectedIndex = message.data.selectedIndex
      const selectedItem = new BridgeElement(this.itemTargets[selectedIndex])

      selectedItem.click()
    })
  }

  buildMenuItems(elements) {
    const items = elements.map((element, index) => this.buildMenuItem(element, index))

    return items
  }

  buildMenuItem(element, index) {
    const bridgeElement = new BridgeElement(element)

    return {
      title: bridgeElement.title,
      ios_icon: element.dataset.iosIcon,
      index: index
    }
  }



} // END export default class extends BridgeComponent {
