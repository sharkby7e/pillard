import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["toggle"]

  connect() {
    this.applyTheme()
    this.updateToggleState()

    this.mediaQuery = window.matchMedia("(prefers-color-scheme: dark)")
    this.mediaQuery.addEventListener("change", this.handleSystemChange.bind(this))
  }

  disconnect() {
    this.mediaQuery?.removeEventListener("change", this.handleSystemChange.bind(this))
  }

  toggle() {
    const isDark = document.documentElement.classList.contains("dark")
    const newTheme = isDark ? "light" : "dark"

    localStorage.setItem("theme", newTheme)
    this.applyTheme()
    this.updateToggleState()
  }

  applyTheme() {
    const theme = this.getTheme()

    if (theme === "dark") {
      document.documentElement.classList.add("dark")
    } else {
      document.documentElement.classList.remove("dark")
    }
  }

  getTheme() {
    const stored = localStorage.getItem("theme")
    if (stored) return stored

    return window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light"
  }

  updateToggleState() {
    if (!this.hasToggleTarget) return

    const isDark = document.documentElement.classList.contains("dark")
    this.toggleTarget.setAttribute("aria-pressed", isDark.toString())
  }

  handleSystemChange() {
    if (!localStorage.getItem("theme")) {
      this.applyTheme()
      this.updateToggleState()
    }
  }
}
