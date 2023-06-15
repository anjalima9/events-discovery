const profilButton = document.getElementById("profil-button")
const newEventButton = document.getElementById("new-event-button")

if(profilButton) {
// Ajoutez un gestionnaire d'événement pour le survol du bouton
profilButton.addEventListener("mouseover", function() {
// Modifiez le texte du bouton lors du survol
profilButton.innerText = "Edit profil"
});

// Ajoutez un gestionnaire d'événement pour la sortie du bouton
profilButton.addEventListener("mouseout", function() {
// Rétablissez le texte initial lorsque le pointeur de la souris quitte le bouton
profilButton.innerHTML = `<i class="bi bi-person-lines-fill"></i>`
});
}

if (newEventButton) {
newEventButton.addEventListener("mouseover", function() {
// Modifiez le texte du bouton lors du survol
newEventButton.innerText = "Create event"
});
newEventButton.addEventListener("mouseout", function() {
// Rétablissez le texte initial lorsque le pointeur de la souris quitte le bouton
newEventButton.innerHTML = `<i class="bi bi-calendar4-event"></i>`
});
}
