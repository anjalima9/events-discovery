export function applyEventCardColors() {
 const eventCards = document.querySelectorAll('.event-card');
 eventCards.forEach((card) => {
   const eventId = card.getAttribute('data-id');
   const randomColor = getRandomColor(eventId);
   card.style.backgroundColor = randomColor;
   console.log("hello");
 });
}


// Fonction pour générer une couleur aléatoire
  function getRandomColor(eventId) {
 let color = localStorage.getItem(`eventCardColor-${eventId}`);
 if (!color) {
   const letters = '0123456789ABCDEF';
   color = '#';
   for (let i = 0; i < 6; i++) {
     color += letters[Math.floor(Math.random() * 16)];
   }
   color += '50'; // Ajoute une opacité semi-transparente
   localStorage.setItem(`eventCardColor-${eventId}`, color);
 }
 return color;
}
