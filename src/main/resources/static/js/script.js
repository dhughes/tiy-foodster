const addIngredient = document.getElementById('add-ingredient');
const addInstruction = document.getElementById('add-instruction');


addIngredient.addEventListener('click', () => {
  let li = document.createElement('li');
  let input = document.querySelector('ul input');
  let newItem = input.cloneNode(true);
  newItem.value = "";

 document.querySelector('ul').appendChild(li).appendChild(newItem);
});

addInstruction.addEventListener('click', () => {
  let li = document.createElement('li');
  let input = document.querySelector('ol input');
  let newItem = input.cloneNode(true);
  newItem.value = "";

 document.querySelector('ol').appendChild(li).appendChild(newItem);
});
