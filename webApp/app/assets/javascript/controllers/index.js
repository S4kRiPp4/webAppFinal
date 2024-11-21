// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"

// Automatically load controllers from the controllers directory
eagerLoadControllersFrom("controllers", application)

// Import and register the DropdownController explicitly
import DropdownController from "./dropdown_controller"
application.register("dropdown", DropdownController)
