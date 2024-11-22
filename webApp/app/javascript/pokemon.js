const initializePokemonPage = () => {
  const loadMoreButton = document.getElementById("load-more");
  const pokemonList = document.getElementById("pokemon-list");
  const searchForm = document.getElementById("search-form");

  console.log("Pokemon.js is loaded");

  // Ensure event listener for "Load More" button
  if (loadMoreButton) {
    loadMoreButton.addEventListener("click", () => {
      const offset = pokemonList.children.length;
      const searchQuery = searchForm
        ? new URLSearchParams(new FormData(searchForm)).toString()
        : "";

      console.log("Load More clicked. Offset:", offset);

      fetch(`/explore_pokemon.json?offset=${offset}&${searchQuery}`)
        .then((response) => response.json())
        .then((data) => {
          console.log("Data received:", data);

          data.forEach((poke) => {
            const col = document.createElement("div");
            col.className = "col-md-4 mb-4";
            col.innerHTML = `
              <div class="card">
                <div class="card-body">
                  <h5 class="card-title">${poke.name}</h5>
                  <p class="card-text">Type: ${poke.types.join(", ")}</p>
                  <p class="card-text">Pokedex Number: ${poke.number}</p>
                </div>
              </div>
            `;
            pokemonList.appendChild(col);
          });

          if (data.length < 10) {
            console.log("No more Pokémon to load. Hiding button.");
            loadMoreButton.style.display = "none";
          }
        })
        .catch((error) => {
          console.error("Error during fetch:", error);
        });
    });
  }

  // Ensure event listener for search form
  if (searchForm) {
    searchForm.addEventListener("submit", (event) => {
      event.preventDefault();
      const searchQuery = new URLSearchParams(new FormData(searchForm)).toString();
      console.log("Search submitted:", searchQuery);

      fetch(`/explore_pokemon.json?${searchQuery}`)
        .then((response) => response.json())
        .then((data) => {
          console.log("Search results:", data);

          pokemonList.innerHTML = "";
          data.forEach((poke) => {
            const col = document.createElement("div");
            col.className = "col-md-4 mb-4";
            col.innerHTML = `
              <div class="card">
                <div class="card-body">
                  <h5 class="card-title">${poke.name}</h5>
                  <p class="card-text">Type: ${poke.types.join(", ")}</p>
                  <p class="card-text">Pokedex Number: ${poke.number}</p>
                </div>
              </div>
            `;
            pokemonList.appendChild(col);
          });

          if (data.length < 10) {
            console.log("Fewer than 10 results. Hiding button.");
            loadMoreButton.style.display = "none";
          } else {
            console.log("Showing Load More button.");
            loadMoreButton.style.display = "block";
          }
        })
        .catch((error) => {
          console.error("Error during search:", error);
        });
    });
  }
};

// Attach events on Turbo Drive load or DOM load
document.addEventListener("turbo:load", initializePokemonPage);
document.addEventListener("DOMContentLoaded", initializePokemonPage);



