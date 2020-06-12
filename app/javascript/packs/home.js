$( document ).ready(function() {

    $('#user_submit_button').on('click', function() {
        const queryString = window.location.search;
        const urlParams = new URLSearchParams(queryString);

        fetch("/download_screenshots?user="+$('#user_input').val())
        .then(data=>{return data.json()})
        .then(res=>{console.log(res)})
        .catch(error=>console.log(error));

    });

});
