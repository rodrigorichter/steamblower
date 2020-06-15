function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

$( document ).ready(function() {

    $('#user_submit_button').on('click', async function() {
        $('#user_submit_text').hide();
        $('#user_submit_spinner').show();
        $('#user_submit_button').prop('disabled', true);

        var page = 1;
        var currentPhoto = 0;

        var steamPageSize = 50;
        var urls = [];
        var stillFindingUrls = true;

        while (stillFindingUrls) {
            var fetchUrl = "/get_screenshot_url?user="+$('#user_input').val()+"&page="+String(page)+"&photo="+String(currentPhoto);
            fetch(fetchUrl)
                .then(data=>{return data.json()})
                .then(res=>{
                    if (res['url'] == '') {
                        stillFindingUrls = false;
                    }
                    else {
                        urls.push(res['url']);
                        $('#urls').val(urls.join("\r\n"));
                        $('#urls').scrollTop($('#urls')[0].scrollHeight);
                        $('#urls').focus();
                    }

                })
                .catch(error=>console.log(error));

            currentPhoto+=1;

            if (currentPhoto >= steamPageSize) {
                currentPhoto = 0;
                page+=1;
            }

            await sleep(250);
        }

    });

    $("#clipboard_button").click(function(){
        $('#urls').select();
        document.execCommand('copy');
    });

});
