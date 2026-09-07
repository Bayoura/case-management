export function createHeader(): HTMLElement {
  const header = document.createElement("header");

  header.innerHTML = `
        <a class="brand" href="/">
            <!-- <img src="" alt="Logo" width="100"> -->
            <span>Digitales Vorgangs- und Serviceportal</span>
        </a>

        <nav>
            <a href="#">Hilfe</a>
            <a href="#">Kontakt</a>
        </nav>
    `;

  return header;
}
