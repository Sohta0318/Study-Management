// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import "chartkick";
import "Chart.bundle";

console.log("again");

document.addEventListener("click", () => {
  setTimeout(() => {
    const button = document.getElementById("button");
    const message = document.getElementById("message");
    if (button) {
      button.addEventListener("click", function () {
        message.classList.add("hide");
      });
    }
  }, 1000);
});

// For index
if (document.getElementById("outer3")) {
  document.getElementById("outer3").addEventListener("click", toggleState3);
  function toggleState3() {
    let galleryView = document.getElementById("galleryView");
    let tilesView = document.getElementById("tilesView");
    let outer = document.getElementById("outer3");
    let slider = document.getElementById("slider3");
    let tilesContainer = document.getElementById("tilesContainer");
    if (slider.classList.contains("active")) {
      slider.classList.remove("active");
      outer.classList.remove("outerActive");
      galleryView.style.display = "flex";
      tilesView.style.display = "none";

      while (tilesContainer.hasChildNodes()) {
        tilesContainer.removeChild(tilesContainer.firstChild);
      }
    } else {
      slider.classList.add("active");
      outer.classList.add("outerActive");
      galleryView.style.display = "none";
      tilesView.style.display = "flex";

      for (let i = 0; i < imgObject.length - 1; i++) {
        let tileItem = document.createElement("div");
        tileItem.classList.add("tileItem");
        tileItem.style.background = "url(" + imgObject[i] + ")";
        tileItem.style.backgroundSize = "contain";
        tilesContainer.appendChild(tileItem);
      }
    }
  }

  let imgObject = [
    "https://storage.googleapis.com/happimet/assets/images/line_chart.png",
    "https://storage.googleapis.com/happimet/assets/images/line_chart.png",
    "https://storage.googleapis.com/happimet/assets/images/line_chart.png",
    "https://storage.googleapis.com/happimet/assets/images/line_chart.png",
    "https://storage.googleapis.com/happimet/assets/images/line_chart.png",
    "https://storage.googleapis.com/happimet/assets/images/line_chart.png",
    "https://storage.googleapis.com/happimet/assets/images/line_chart.png",
    "https://storage.googleapis.com/happimet/assets/images/line_chart.png",
    "https://storage.googleapis.com/happimet/assets/images/line_chart.png",
    "https://storage.googleapis.com/happimet/assets/images/line_chart.png",
    "https://storage.googleapis.com/happimet/assets/images/line_chart.png",
  ];

  let mainImg = 0;
  let prevImg = imgObject.length - 1;
  let nextImg = 1;

  function loadGallery() {
    let mainView = document.getElementById("mainView");
    mainView.style.background = "url(" + imgObject[mainImg] + ")";

    let leftView = document.getElementById("leftView");
    leftView.style.background = "url(" + imgObject[prevImg] + ")";

    let rightView = document.getElementById("rightView");
    rightView.style.background = "url(" + imgObject[nextImg] + ")";

    let linkTag = document.getElementById("linkTag");
    linkTag.href = imgObject[mainImg];
  }

  function scrollRight() {
    prevImg = mainImg;
    mainImg = nextImg;
    if (nextImg >= imgObject.length - 1) {
      nextImg = 0;
    } else {
      nextImg++;
    }
    loadGallery();
  }

  function scrollLeft() {
    nextImg = mainImg;
    mainImg = prevImg;

    if (prevImg === 0) {
      prevImg = imgObject.length - 1;
    } else {
      prevImg--;
    }
    loadGallery();
  }

  document.getElementById("navRight").addEventListener("click", scrollRight);
  document.getElementById("navLeft").addEventListener("click", scrollLeft);
  document.getElementById("rightView").addEventListener("click", scrollRight);
  document.getElementById("leftView").addEventListener("click", scrollLeft);
  document.addEventListener("keyup", function (e) {
    if (e.keyCode === 37) {
      scrollLeft();
    } else if (e.keyCode === 39) {
      scrollRight();
    }
  });

  loadGallery();
}

// For modal

// if (document.querySelector(".modal-overlay")) {
//   var openmodal = document.querySelectorAll(".modal-open");
//   for (var i = 0; i < openmodal.length; i++) {
//     openmodal[i].addEventListener("click", function (event) {
//       event.preventDefault();
//       toggleModal();
//     });
//   }
//   const overlay = document.querySelector(".modal-overlay");
//   overlay.addEventListener("click", toggleModal);

//   var closemodal = document.querySelectorAll(".modal-close");
//   for (var i = 0; i < closemodal.length; i++) {
//     closemodal[i].addEventListener("click", toggleModal);
//   }

//   document.onkeydown = function (evt) {
//     evt = evt || window.event;
//     var isEscape = false;
//     if ("key" in evt) {
//       isEscape = evt.key === "Escape" || evt.key === "Esc";
//     } else {
//       isEscape = evt.keyCode === 27;
//     }
//     if (isEscape && document.body.classList.contains("modal-active")) {
//       toggleModal();
//     }
//   };

//   function toggleModal() {
//     const body = document.querySelector("body");
//     const modal = document.querySelector(".modal");
//     modal.classList.toggle("opacity-0");
//     modal.classList.toggle("pointer-events-none");
//     body.classList.toggle("modal-active");
//   }
// }

// message
const output = document.getElementById("paragraph");
if (output) {
  output.innerText = "What is you name?";
  const button = document.getElementById("button");
  button.addEventListener("click", () => {
    output.innerText = "Please input your email";
  });
}
