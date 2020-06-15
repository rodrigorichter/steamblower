function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

$( document ).ready(function() {

    $('#user_submit_button').on('click', async function() {
        var page = 1;
        var currentPhoto = 0;

        var steamPageSize = 50;
        var urls = [];
        var stillFindingUrls = true;

        while (stillFindingUrls) {
            fetch("/download_screenshots?user="+$('#user_input').val()+"&page="+String(page)+"&photo="+String(currentPhoto))
                .then(data=>{return data.json()})
                .then(res=>{
                    if (res['url'] == '') {
                        stillFindingUrls = false;
                    }
                    else {
                        urls.push(res['url']);
                        $('#urls').val(urls.join("\r\n"));
                    }
                    
                })
                .catch(error=>console.log(error));

            currentPhoto+=1;

            if (currentPhoto >= steamPageSize) {
                currentPhoto = 0;
                page+=1;
            }
console.log(urls);
            await sleep(250);
        }

        

    });

});
