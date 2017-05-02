const moreItems = document.querySelectorAll('.more');

for (var i = 0; i < moreItems.length; i++) {

    moreItems[i].addEventListener('click', (e) => {
        if (e.target.getAttribute("aria-label") === "add-ingrdient") {
            let li = document.createElement('li');
            let input = document.querySelector('ul textarea');
            let newItem = input.cloneNode(true);
            newItem.value = "";
            newItem.name = newItem.name.replace(/(.*\[)(.*?)(\].*)/, "$1" + document.querySelectorAll("ul textarea").length + "$3");
            document.querySelector('ul').appendChild(li).appendChild(newItem);

        } else if (e.target.getAttribute("aria-label") === "add-instruction") {
            let li = document.createElement('li');
            let input = document.querySelector('ol textarea');
            let newItem = input.cloneNode(true);
            newItem.value = "";
            newItem.name = newItem.name.replace(/(.*\[)(.*?)(\].*)/, "$1" + document.querySelectorAll("ol textarea").length + "$3");
            document.querySelector('ol').appendChild(li).appendChild(newItem);
        }
    })
}
;
