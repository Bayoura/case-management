import { createHeader } from "./components/header";
import { createFooter } from "./components/footer";

document.body.prepend(createHeader());
document.body.append(createFooter());

console.log("Case Management System is running!");
