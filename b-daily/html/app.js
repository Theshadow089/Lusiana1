$('body').hide();

$(document).keyup(function(event) {
    if (event.key === 'Escape') {
        $('body').hide();
        $.post('https://b-daily/close', JSON.stringify({}));
        $(".gift").animate({
            left: "-309.0473656200106vw"
        });
    }
});

window.addEventListener('message', function(event) {
    if (event.data.type == "showUI") {
        openingAnimation(event.data.access)
    }
});

function openingAnimation(index) {
    if (index) {
        $('body').show();
        setTimeout(() => {
            $(".gift").animate({
                left: "42.948376796168176vw"
            });
        }, 50);
    } else {
        $.post('https://b-daily/close', JSON.stringify({}));
    }
}

function claim() {
    $('body').hide();
    $.post('https://b-daily/close', JSON.stringify({}));
    $.post('https://b-daily/claim', JSON.stringify({}));
}