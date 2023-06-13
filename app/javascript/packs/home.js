import dualipa from '../../assets/images/dualipa.jpg'
import marrathon from '../../assets/images/marrathon.jpg'
import metal_concert from '../../assets/images/metal_concert.jpg'

// Sélectionnez votre en-tête à l'aide d'un sélecteur approprié
const header = document.getElementById("my-header")
const populare = document.getElementById('custom-cards')

class Populare {
  constructor (title, bgImage, profilImage, place, duration) {
    this.title = title
    this.bgImage = bgImage
    this.profilImage = profilImage
    this.place = place
    this.duration = duration
  }

  addPopulare () {
    const card = document.createElement('div');
    card.classList.add('col');
    card.innerHTML = `
      <div class="card card-cover h-100 overflow-hidden text-bg-dark rounded-4 shadow-lg" style="background-image: url('${this.bgImage}'); background-size: cover;">
        <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
          <h3 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">${this.title}</h3>
          <ul class="d-flex list-unstyled mt-auto">
            <li class="me-auto">
              <img src="${this.profilImage}" alt="Amorcer" width="32" height="32" class="rounded-circle border border-white" />
            </li>
            <li class="d-flex align-items-center me-3">
              <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#geo-fill"></use></svg>
              <small>${this.place}</small>
            </li>
            <li class="d-flex align-items-center">
              <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#calendar3"></use></svg>
              <small>${this.duration}</small>
            </li>
          </ul>
        </div>
      </div>
    `;
    populare.appendChild(card);
  }
}

window.addEventListener('scroll', () => {
  // Déterminez la position de défilement
  const scrollPosition = window.scrollY;

  // Ajoutez ou supprimez la classe `.white-background` en fonction de la position de défilement
  if (scrollPosition > 0) {
    header.classList.add('bg-light');
  } else {
    header.classList.remove('bg-light');
    header.classList.add('bg-light-50');
  }
});

if (populare) {
  new Populare("Dua lipa concert", dualipa, dualipa, 'london', '3d').addPopulare()
  new Populare("Marrathon festival", marrathon, marrathon, 'vienne', '6d').addPopulare()
  new Populare("Burry tomorrow in metal festival", metal_concert, metal_concert, 'vancouvert', '2d').addPopulare()
}

