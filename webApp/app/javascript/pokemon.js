document.addEventListener("turbo:load", initializePokemonPage);
document.addEventListener("DOMContentLoaded", initializePokemonPage);

function initializePokemonPage() {
  const loadMoreButton = document.getElementById("load-more-button");
  const pokemonList = document.getElementById("pokemon-list");
  const searchForm = document.getElementById("search-form");

  if (loadMoreButton) {
    setupLoadMoreButton(loadMoreButton, pokemonList, searchForm);
  }

  if (searchForm) {
    searchForm.addEventListener("submit", (event) => {
      event.preventDefault(); // Prevent default form submission
      handleSearch(searchForm, pokemonList, loadMoreButton);
    });
  }
}

// Handle "Load More" functionality
function handleLoadMore(button, list) {
  const url = button.getAttribute("formaction") || button.getAttribute("data-url");

  if (!url) {
    console.error("Load More button does not have a valid URL.");
    return;
  }

  fetch(url, { headers: { Accept: "text/html" } })
    .then((response) => response.text())
    .then((html) => {
      const tempDiv = document.createElement("div");
      tempDiv.innerHTML = html;

      // Append only the new Pokémon cards
      const newCards = tempDiv.querySelectorAll(".pokemon-card");
      newCards.forEach((card) => {
        list.appendChild(card);
      });

      // Remove the "Load More" button if fewer than 10 new cards are loaded
      if (newCards.length < 10) {
        button.style.display = "none";
      } else {
        // Update button's URL for the next batch
        const offset = parseInt(button.dataset.offset || "0", 10) + newCards.length;
        button.setAttribute("data-url", `/explore_pokemon?offset=${offset}`);
        button.dataset.offset = offset;
      }
    })
    .catch((error) => {
      console.error("Error while loading more Pokémon:", error);
      alert("Unable to load more Pokémon. Please try again later.");
    });
}

// Handle search functionality
function handleSearch(form, list, button) {
  const searchQuery = new URLSearchParams(new FormData(form)).toString();

  fetch(`/explore_pokemon?${searchQuery}`, {
    headers: { Accept: "text/html" }
  })
    .then((response) => response.text())
    .then((html) => {
      const tempDiv = document.createElement("div");
      tempDiv.innerHTML = html;

      // Replace the list with only the Pokémon cards
      const newCards = tempDiv.querySelectorAll(".pokemon-card");
      list.innerHTML = "";
      newCards.forEach((card) => {
        list.appendChild(card);
      });

      // Show or hide the "Load More" button based on results
      if (newCards.length < 10) {
        button.style.display = "none";
      } else {
        button.style.display = "block";
        const offset = newCards.length;
        button.setAttribute("data-url", `/explore_pokemon?offset=${offset}`);
        button.dataset.offset = offset;
      }

      // Reattach the "Load More" button functionality
      setupLoadMoreButton(button, list, form);
    })
    .catch((error) => {
      console.error("Error while performing search:", error);
      alert("Unable to fetch Pokémon search results. Please try again.");
    });
}

// Setup "Load More" button functionality
function setupLoadMoreButton(button, list, form) {
  button.removeEventListener("click", handleLoadMore);
  button.addEventListener("click", (event) => {
    event.preventDefault();
    handleLoadMore(button, list, form);
  });
}
