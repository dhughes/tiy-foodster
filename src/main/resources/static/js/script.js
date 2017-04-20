const moreItems = document.querySelectorAll('.more');

for(var i=0; i<moreItems.length; i++){

  moreItems[i].addEventListener('click', (e) => {
    if (e.target.getAttribute("aria-label") === "add-ingrdient"){
      let li = document.createElement('li');
      let input = document.querySelector('ul input');
      let newItem = input.cloneNode(true);
      newItem.value = "";
      document.querySelector('ul').appendChild(li).appendChild(newItem);

    } else if (e.target.getAttribute("aria-label") === "add-instruction"){
      let li = document.createElement('li');
      let input = document.querySelector('ol input');
      let newItem = input.cloneNode(true);
      newItem.value = "";
      document.querySelector('ol').appendChild(li).appendChild(newItem);
    }
  })
};
