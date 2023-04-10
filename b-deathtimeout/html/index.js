window.addEventListener("message", (event) => {
    event = event.data;
    if (event.action == "updateTimeout") {
        $(".cooldown").html(`Du bist noch für <span class="farbakzent">${event.data}</span> kampfunfähig`);
    } else if (event.action == "hideTimeout") {
        $(".cooldown").html(``);
    }
});