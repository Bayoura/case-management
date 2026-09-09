export function createPersonForm(): HTMLElement {
  const section = document.createElement("section");

  section.classList.add("form-section");

  section.innerHTML = `
    <h2>Angaben zur Person</h2>

    <div class="form-group">
      <label for="first-name">Vorname</label>
      <input type="text" id="first-name" name="first-name" required />
    </div>

    <div class="form-group">
      <label for="last-name">Nachname</label>
      <input type="text" id="last-name" name="last-name" required />
    </div>

    <div class="form-group">
      <label for="birthdate">Geburtsdatum</label>
      <input type="date" id="birthdate" name="birthdate" required />
    </div>

    <div class="form-group">
      <label for="email">E-Mail-Adresse</label>
      <input type="email" id="email" name="email" required />
    </div>

    <div class="form-group">
      <label for="customer-number">
        Kunden- oder Mitgliedsnummer <span>(optional)</span>
      </label>
      <input type="text" id="customer-number" name="customer-number" />
    </div>
  `;

  return section;
}
