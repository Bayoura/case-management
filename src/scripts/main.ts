import { createHeader } from "./components/header";
import { createFooter } from "./components/footer";
import { createPersonForm } from "./components/person-form";

document.body.prepend(createHeader());
document.body.append(createFooter());
const personFormContainer = document.getElementById("person-form-container");

if (personFormContainer) {
  personFormContainer.appendChild(createPersonForm());
}

console.log("Case Management System is running!");
