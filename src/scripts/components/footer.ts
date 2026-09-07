export function createFooter(): HTMLElement {
  const footer = document.createElement("footer");

  footer.innerHTML = `
        <p>&copy; 2026 Verwaltungssystem. Alle Rechte vorbehalten.</p>

        <nav class="footer-nav">
            <a href="#">Impressum</a>
            <a href="#">Datenschutz</a>
        </nav>
    `;

  return footer;
}
