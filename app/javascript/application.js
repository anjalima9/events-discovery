// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import "./packs/home"
import {applyEventCardColors} from "./packs/events"

document.addEventListener('turbo:load', () => {
    applyEventCardColors();
  });
