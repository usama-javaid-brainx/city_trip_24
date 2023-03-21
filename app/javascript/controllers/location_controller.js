import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["subCategorySelect", "categorySelect", "addressField", "addressBtn"]

  static values = {
    subCategoryUrl: String,
    coordinatesUrl: String
  }

  connect() {
  }

  fetchSubcategories() {
    let url = `${this.subCategoryUrlValue}?category_id=${this.categorySelectTarget.value}`
    let that = this
    var xhr = new XMLHttpRequest()
    xhr.open('GET', url, true)
    xhr.setRequestHeader('Content-Type', 'application/json')
    xhr.onload = function () {
      that.populateSubCategories(JSON.parse(xhr.responseText))
    }
    xhr.send()
  }

  populateSubCategories(response) {
    this.subCategorySelectTarget.innerHTML = ''
    for (let i = 0; i < response['sub_categories'].length; i++) {
      let categoryOption = document.createElement("option")
      categoryOption.text = response['sub_categories'][i].name
      categoryOption.value = response['sub_categories'][i].id
      this.subCategorySelectTarget.appendChild(categoryOption)
    }
  }

  fetchCurrentCoordinates() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition((position) => {
        this.fetchCurrentLocation(position.coords.latitude, position.coords.longitude)
      })
    } else {
      alert("Geolocation is not supported by this browser.")
    }
  }

  fetchCurrentLocation(lat, lng) {
    let url = `${this.coordinatesUrlValue}?lat=${lat}&lng=${lng}`
    let that = this
    var xhr = new XMLHttpRequest()
    xhr.open('GET', url, true)
    xhr.setRequestHeader('Content-Type', 'application/json')
    xhr.onload = function () {
      let response = JSON.parse(xhr.responseText)
      if (response.address) {
        that.addressFieldTarget.value = response.address
        that.addressFieldTarget.style.color = '#0096FF'
      } else {
        that.addressFieldTarget.style.color = 'red'
        that.addressFieldTarget.value = 'No address found'
      }

      that.addressFieldTarget.classList.remove('d-none')
      that.addressBtnTarget.classList.add('d-none')
    }
    xhr.send()
  }
}
