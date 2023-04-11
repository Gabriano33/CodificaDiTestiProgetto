
// Questa funzione gestisce l'evento di click sui bottoni per evidenziare i termini e il bottone terminologia
function toggleElement() {
  var elemento = document.getElementById("pagina3"); 
  var elemento2 = document.getElementById("pagina14"); 
  if (elemento.style.display === "none") { 
  elemento.style.display = "block"; 
  elemento2.style.display = "none"; 
  } else {
  elemento.style.display = "none"; 
  elemento2.style.display = "block"; 
  }
  }

// Questa funzione gestisce l'evento di click sul bottone Compari
function Compari() {
  const gloss = document.querySelectorAll (".gloss"); 
  var elemento = document.getElementById("terminol"); 
  if (elemento.style.display === "none") { 
  elemento.style.display = "block"; 
  gloss.forEach(vocabolario => vocabolario.classList.toggle("inline_block")) 
  } else {
  elemento.style.display = "none"; 
  gloss.forEach(vocabolario => vocabolario.classList.toggle("gloss")) 
  }
  }

// Aggiunge un event listener che ascolta quando la pagina è completamente caricata
window.addEventListener("DOMContentLoaded", () => {

// Seleziona gli elementi HTML tramite i loro ID
  const corr = document.querySelector("#correzioni");
  const orig = document.querySelectorAll(".orig");
  const reg = document.querySelectorAll(".reg");

  const cancel = document.querySelector("#cancellazione");
  const del = document.querySelectorAll(".del");
  const gap = document.querySelectorAll(".gap");

  const agg = document.querySelector("#aggiunte");
  const supplied = document.querySelectorAll(".add");

  const topo = document.querySelector("#toponimo");
  const toponimi = document.querySelectorAll(".placeName");

  const termi = document.querySelector("#termine");
  const terms = document.querySelectorAll(".terms");

  const abb = document.querySelector("#abbreviazione");
  const abbr = document.querySelectorAll(".abbr");
  const expan = document.querySelectorAll(".expan");

  
  corr.addEventListener("click", () => {
    orig.forEach(scelta => scelta.classList.toggle("none"));
    reg.forEach(estensione => estensione.classList.toggle("inline_block"));
  });

  
  cancel.addEventListener("click", () => {
    del.forEach(canc => canc.classList.toggle("line_through"));
    gap.forEach(vuota => vuota.classList.toggle("none"));
  });

  
  agg.addEventListener("click", () => {
        supplied.forEach(suppl => suppl.classList.toggle("purple"));
  });

  
  topo.addEventListener("click", () => {
    toponimi.forEach(nomi => nomi.classList.toggle("bordeaux"));
  });

  
  termi.addEventListener("click", () => {
    terms.forEach(termini => termini.classList.toggle("yellow"));
  });


abb.addEventListener("click", () => {
  abbr.forEach(abbre => abbre.classList.toggle("none"));
  expan.forEach(expan => expan.classList.toggle("inline_block"));
  })
});